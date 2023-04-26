#!/bin/bash

if [ $# -ne 1 ];
then
  echo 'argument is wrong'
  exit 1
fi

function stop_job_running(){
  rm output_`cat pids_file`.txt
  exit 0
}

job_running(){
  i=0
  while [ $i -lt 20 ]; do
    trap "stop_job_running" 2 15 #正常系の処理
    true; 
    i=`expr $i + 1`
    echo $i >> $pids_txt
    sleep 1;
  done
  rm output_`cat pids_file`.txt
}

if [ $1 = 'start' ];
then
  file_name=*.txt
  if [ ! -e $file_name ];
  then  # ジョブを実行
    pid=$$
    echo $pid > pids_file
    touch output_"$pid".txt
    pids_txt=output_"$pid".txt
    job_running
    exit 0
  elif [ -e $file_name ];
  then  # 既にジョブが実行中
    echo "already running"
    exit 0
  else
    exit 1 
  fi
elif [ $1 = 'stop' ];
then
  file_name=*.txt
  if [ -e $file_name ];
  then  # ジョブを終了
    PID=-1
    while read p;
    do
      PID=$p
    done < 'pids_file'
    kill -15 $PID
    rm output_`cat pids_file`.txt
  elif [ ! -e $file_name ];
  then  # 既にジョブが終了
    echo "Not running"
    exit 0
  else
    exit 1 
  fi
elif [ $1 = 'status' ];
then  # 現在の状態を表示
  file_name=*.txt
  if [ -e $file_name ];
  then  # 既にジョブが実行中
    PID=-1 #プロセスidは1から始まるので-1というのは存在しないIDとなる。なぜPID=-1としているかというと、kill -15 をしている箇所でPIDが何もなかったらエラーになる可能性があるため
    while read p;
    do
      PID=$p
    done < 'pids_file'
    echo Process is running pid=$PID
    exit 0
  elif [ ! -e $file_name ];
  then  # 既にジョブが終了
    PID=-1
    while read p;
    do
      PID=$p
    done < 'pids_file'
    echo Process is not running pid=$PID
    exit 0
  else
    echo 'wrong argument'
    exit 1 
  fi
else
  echo 'wrong argument'
  exit 1 
fi