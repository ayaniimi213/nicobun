nicobun
=======

ニコニコ動画の研究用公開データセットをデータベースに取り込むためのスクリプト集。

情報学研究データリポジトリ ニコニコ動画コメント等データ http://www.nii.ac.jp/cscenter/idr/nico/nico.html

■ 必要なライブラリ、ツール
----
- Ruby
- nkf
- s3cmd
- find, split
- PostgreSQL(psql) <- Amazon Redshift操作用


■ ファイル
----

ファイル中の&lt;Your-S3-bucket&gt;, &lt;Your-Access-Key-ID&gt;, &lt;Your-Secret-Access-Key&gt;を環境に合わせて変更のこと。

- videojson2tsv.rb: ニコニコ動画の動画データにsmidを付与し、tsv(タブ区切り)フォーマットに変更
- threadjsonaddsmid.rb: ニコニコ動画の動画データにsmidを付与し、jsonフォーマットで出力
- make_thread_json.sh: コメントデータ流し込み用のSQLを作成する

- create-redshift.sql: tsvファイルを読み込んで、Amazon Redshift上にデータベースを構築する
- create_comment_data_temp.sql:コメントデータ(json)を読み込んで,Amazon Redshift上にデータベースを構築する
- createdb_sampling0000.sql:コメントデータ(json)を読み込んで,Amazon Redshift上にデータベースを構築する
- createdb_sampling10.sql: 読み込んだデータから10分の一サンプリング(video_idの最後が0のもののみ)を作成
- createdb_sampling100.sql: 読み込んだデータから100分の一サンプリング(video_idの最後が00のもののみ)を作成
- createdb_uniq.sql: 読み込んだデータから重複を取り除く

■ 処理の流れ
----

- videojson2tsv.rbでtsv(タブ区切り)フォーマットに変更したものを作成。
- threadjsonaddsmid.rbでsmidを付与したjsonファイルを作成。
- Amazon S3上にコピー
 - <Your-S3-bucket>/videoinfo_tsv : 動画データ、タグデータ
 - <Your-S3-bucket>/comment_data : コメントデータデータ
- psql等を使って、create-redshift.sql, create_comment_data_temp.sqlを処理
- 読み込んだデータに重複があるようなら、createdb_uniq.sqlを使って、重複を削除したデータを作成
- 必要なら、createdb_sampling0000.sql, createdb_sampling100.sql, createdb_sampling10.sqlを使って、サンプリングデータを作成

Redshiftでは、4MB以上のJSONファイルを読み込めないので、smidを付与したJSONファイルを適当に分割するようにしている。
コメントデータは重たいので、 一回のcopyではメモリ不足になることがある。make_thread_json.rbを使って、分割して読み込むためのSQLを利用するとスムーズに読み込みが行える。


■ ニコニコデータセットのテーブル情報
----

全数データに対してSQLを実行すると、想像以上に時間がかかることになります。
全数データを使うときは、まずサンプリングデータを使って、試してみてからにしてください。

NNNN (4桁の数値) は、各動画の ID である "sm数字" や "nm数字" の数字部分を8桁に0埋めした、先頭の4桁部分です。


- 全数(およそ 8,400,000)
 - videoinfo: 動画情報
 - table tag_data: タグ情報
 - comment_data: コメント情報

- 10分の一サンプリング(およそ 910,000)
 - videoinfo_sampling10: 動画情報(video_idの最後が0のもののみ)
 - table tag_data_sampling10: タグ情報(video_idの最後が0のもののみ)
 - comment_data_sampling10: コメント情報(video_idの最後が0のもののみ)

- 100分の一サンプリング(およそ 160,000)
 - videoinfo_sampling100: 動画情報(video_idの最後が00のもののみ)
 - table tag_data_sampling100: タグ情報(video_idの最後が00のもののみ)
 - comment_data_sampling100: コメント情報(video_idの最後が00のもののみ)

- 2000分の一サンプリング(およそ 1,800)
 - videoinfo_sampling0000: 動画情報(NNNNが0000のもののみ)
 - table tag_data_sampling0000: タグ情報(NNNNが0000のもののみ)
 - comment_data_sampling0000: コメント情報(NNNNが0000のもののみ)

- コメント分割
 - テーブル, NNNN
 - comment_data00, 0000-0099
 - comment_data01, 0100-0199
 - comment_data02, 0200-0299
 - comment_data03, 0300-0399
 - comment_data04, 0400-0499
 - comment_data05, 0500-0599
 - comment_data06, 0600-0699
 - comment_data07, 0700-0799
 - comment_data08, 0800-0899
 - comment_data09, 0900-0999
 - comment_data10, 1000-1099
 - comment_data11, 1100-1199
 - comment_data12, 1200-1299
 - comment_data13, 1300-1399
 - comment_data14, 1400-1499
 - comment_data15, 1500-1599
 - comment_data16, 1600-1699
 - comment_data17, 1700-1799
 - comment_data18, 1800-1899
 - comment_data19, 1900-1925
