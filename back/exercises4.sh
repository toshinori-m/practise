# !/bin/bash
calcurate_sum(){
  awk '{sum+=$1}END{print sum}' $file_name
}
calcurate_avg(){
  awk '{sum+=$1}END {print sum/NR}' $file_name
}
calcurate_min(){
  awk '{if(min>$1 || NR == 1) min=$1} END {print min}' $file_name
}
calcurate_max(){
  awk '{if($1>max || NR == 1) max=$1} END {print max}' $file_name
}

func(){
  if [ $command = "sum" ] ; then  # 答えがsum
    calcurate_sum
  elif [ $command = "avg" ] ; then  # 答えがavg
    calcurate_avg
  elif [ $command = "min" ] ; then  # 答えがmin
    calcurate_min
  elif [ $command = "max" ] ; then  # 答えがmax
    calcurate_max
  else
    exit 1 # sum, avg, min, maxでない
  fi
}
read -p "ファイル名を入力=> " file_name
read -p $file_name"で良いですか？良ければy、ダメならn => " answer
if [ $answer = "y" ] ; then  # 答えがyes
  if [ -e $file_name ]; then
    read -p "次の中から計算したい項目（sum, avg, min, max）を実行=> " command
    func
    exit 0
  elif [ ! -e $file_name ]; then
    echo "ファイルが存在しません。"
    exit 1 
  else
    exit 1 
  fi
elif [ $answer = "n" ] ; then  # 答えがno
  exit 0
else
  exit 1 
fi