nicobun
=======

ニコニコ動画の研究用公開データセットをデータベースに取り込むためのスクリプト集。

情報学研究データリポジトリ ニコニコ動画コメント等データ http://www.nii.ac.jp/cscenter/idr/nico/nico.html

■ 必要なライブラリ、ツール
----
- Ruby
- nkf
- PostgreSQL(psql) <- Amazon Redshift操作用


■ ファイル
----
ファイル中の&lt;Your-S3-bucket&gt;, &lt;Your-Access-Key-ID&gt;, &lt;Your-Secret-Access-Key&gt;を環境に合わせて変更のこと。

- videojson2tsv.rb: ニコニコ動画の動画データにsmidを付与し、tsv(タブ区切り)フォーマットに変更
- videoson2tsv_sampling100.rb: smidの下2桁が00のみにvideojson2tsv.rbと同じ処理を行う
- create-redshift.sql: tsvファイルを読み込んで、Amazon Redshift上にデータベースを構築する。
