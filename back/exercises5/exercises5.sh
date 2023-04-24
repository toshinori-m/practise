# !/bin/bash
job_running(){
i=0
while [ $i -lt 20 ]; do
true; 
  i=`expr $i + 1`
  echo $i >> output_"$pid".txt
  sleep 1;
done
rm *.txt
}

read -p "start,stop,statusのいずれかを入力=> " control_command
pid=$$
file_name=*.txt
if [ $control_command = "start" ]; then
  if [ ! -e $file_name ]; then  # ジョブを実行
    job_running
    exit 0
  elif [ -e $file_name ]; then  # 既にジョブが実行中
    echo "already running"
    exit 0
  else
    exit 1 
  fi
elif [ $control_command = "stop" ]; then
  if [ -e $file_name ]; then  # ジョブを終了
    # trap "echo '`job_running`を終了します.'" EXIT
    trap 'rm *.txt ; exit 1'  1 2 3 15
  elif [ ! -e $file_name ]; then  # 既にジョブが終了
    echo "Not running"
    exit 0
  else
    exit 1 
  fi
elif [ $control_command = "status" ]; then  # 現在の状態を表示
  if [ -e $file_name ]; then  # 既にジョブが実行中
    echo "$pid":"running"
    exit 0
  elif [ ! -e $file_name ]; then  # 既にジョブが終了
    echo "$pid":"Not running"
    exit 0
  else
    exit 1 
  fi
else
  exit 1 
fi