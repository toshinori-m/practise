# !/bin/bash
echo -n "ファイル名を入力=> "
read file_name
echo -n $file_name"で良いですか？良ければy、ダメならn => "
read answer
if [ $answer = "y" ] ; then  # 答えがyes
  if [ -e $file_name ]; then
    echo -n "次の中から計算したい項目（sum, avg, min, max）を実行=> "
    read function
    if [ $function = "sum" ] ; then  # 答えがsum
      awk '{sum+=$1}END{print sum}' $file_name
    elif [ $function = "avg" ] ; then  # 答えがavg
      awk '{x++;sum+=$1}END {print sum/x}' $file_name
    elif [ $function = "min" ] ; then  # 答えがmin
      awk 'BEGIN{min=1000000} {if($1 !="" && min>$1) min=$1}END {print min}' $file_name
    elif [ $function = "max" ] ; then  # 答えがmax
      awk 'NR==1 {max=$1} {if($1>max) max=$1} END{print max}' $file_name
    else
      exit 1 # sum, avg, min, maxでない
    fi
  elif [ ! -e $file_name ]; then
    echo "ファイルが存在しません。"
  else
    exit 1 
  fi
elif [ $answer = "n" ] ; then  # 答えがno
  exit 0
else
  exit 1 
fi