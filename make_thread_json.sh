#!/bin/bash
THREAD_SRC=${HOME}/thread_src
THREAD_JSON=${HOME}/thread_json

TARGET_ARRAY=$(find ${THREAD_SRC}/ -name "*.tar.gz" | sed 's!^.*/!!' | sed 's!\.tar\.gz!!')


for TARGET in ${TARGET_ARRAY[@]}; do
	if [ ! -e ${THREAD_JSON}/${TARGET} ]; then
		cd ${THREAD_SRC}
		tar zxvf ${TARGET}.tar.gz
		mkdir ${THREAD_JSON}/${TARGET}
		cd ${THREAD_JSON}/${TARGET}
		ruby ${HOME}/nicobun/threadjsonaddsmid.rb ${THREAD_SRC}/${TARGET}/*.dat
		find . -size +400k -exec gzip -d {} \;
		for FILE in `find ./ -name "*.json"`; do
		    split -l 5000 -a 3 ${FILE} ${FILE}- 
		    rm -f ${FILE}
		done
		for FILE in `find ./ -name "*.json-*" -type f`; do
		    gzip -c ${FILE} > ${FILE}.gz
                    rm -f ${FILE}
		done
                rm -fR ${THREAD_SRC}/${TARGET}
	fi
done

s3cmd put -r ${THREAD_JSON}/* <Your-S3-bucket>/comment_data_json/

