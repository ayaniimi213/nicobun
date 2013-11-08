#!/bin/bash
THREAD_SRC=${HOME}/thread_src
THREAD_TSV=${HOME}/thread_tsv

TARGET_ARRAY=$(find ${THREAD_SRC}/ -name "*.tar.gz" | sed 's!^.*/!!' | sed 's!\.tar\.gz!!')
TARGET_ARRAY=(0003)

for TARGET in ${TARGET_ARRAY[@]}; do
	if [ ! -e ${THREAD_TSV}/${TARGET} ]; then
		cd ${THREAD_SRC}
		tar zxvf ${TARGET}.tar.gz
		mkdir ${THREAD_TSV}/${TARGET}
		cd ${THREAD_TSV}/${TARGET}
		ruby ${HOME}/nicobun/threadjson2tsv.rb ${THREAD_SRC}/${TARGET}/*.dat
	fi
done
