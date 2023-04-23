# !/bin/bash
execute_job(){
i=0
while [ $i -lt 20 ]; do
true; 
  i=`expr $i + 1`
  pid=$$
  echo $i >> output_"$pid".txt
  sleep 1;
done
}

read -p "start,stop,statusのいずれかを入力=> " control_command
# ps=`ps aux | grep exercises5.sh | grep -v grep | wc -l`
if [ $control_command = "start" ]; then
  if [ $state!="start" ]; then  # ジョブを実行
    state='start'
    execute_job
    exit 0
  elif [ $state="start" ]; then  # 既にジョブが実行中
    echo "already running"
    exit 0
  else
    exit 1 
  fi
elif [ $control_command = "stop" ]; then
  if [ $state="start" ]; then  # ジョブを終了
    kill -15
    exit 0
  elif [ $state!="start" ]; then  # 既にジョブが終了
    echo "Not running"
    exit 0
  else
    exit 1 
  fi
elif [ $control_command = "status" ]; then  # 現在の状態を表示
  echo jobs -l
  exit 0
else
  exit 1 
fi