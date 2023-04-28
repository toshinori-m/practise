# !/bin/bash
# files="*"
# fileary=()
# for filepath in $files; do
#   if [ -f $filepath ] ; then
#     fileary+=("$filepath")
#   fi
# done
echo "ファイル一覧"
# for i in ${fileary[@]}; do
#   echo $i
# done
ls -1 #⇦この書き方だと doneから上と同じ結果になる
read -p 'ファイル名を入力してください: ' file_name
if [ -e $file_name ] ; then
  read -p 'ファイルに追記する値を入力してください: ' input_val
  echo "$input_val" >> $file_name
else
  echo 'ファイルが存在しません'
fi