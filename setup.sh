#!/bin/sh
# ホームディレクトリに dotfiles ディレクトリ内のファイルのリンクを貼る.

pushd `pwd`
cd $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

SRC_DIR=${CUR_DIR}/dotfiles
DEST_DIR=~

ls -1a "${SRC_DIR}" | while read line
do
	if [ "${line}" = "." ] \
		|| [ "${line}" = ".." ] \
		|| [ "${line}" = ".DS_Store" ] \
		; then
		echo "skip '${line}'"
	else
		ln -s -v -f "${SRC_DIR}/${line}" "${DEST_DIR}/${line}"
	fi
done

popd

