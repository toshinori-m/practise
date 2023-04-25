job_running(){
i=0
while [ $i -lt 20 ]; do
  true; 
  i=`expr $i + 1`
  echo $i >> $pids_txt
  sleep 1;
done
rm output_`cat pids_file`.txt
}

read -p "start,stop,statusのいずれかを入力=> " control_command
file_name=*.txt
if [ $control_command = "start" ]; then
  if [ ! -e $file_name ]; then  # ジョブを実行
    pid=$$
    echo $pid > pids_file
    touch output_"$pid".txt
    pids_txt=output_"$pid".txt
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
    kill -15 `cat pids_file`
    rm output_`cat pids_file`.txt
  elif [ ! -e $file_name ]; then  # 既にジョブが終了
    echo "Not running"
    exit 0
  else
    exit 1 
  fi
elif [ $control_command = "status" ]; then  # 現在の状態を表示
  if [ -e $file_name ]; then  # 既にジョブが実行中
    echo `cat pids_file`:"running"
    exit 0
  elif [ ! -e $file_name ]; then  # 既にジョブが終了
    echo `cat pids_file`:"Not running"
    exit 0
  else
    exit 1 
  fi
else
  exit 1 
fi