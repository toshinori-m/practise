#!/bin/bash

if [ $# -ne 1 ];
then
  echo 'argument is wrong'
  exit 1
fi

function stop_exam7(){
  PID=-1
  while read p;
  do
    PID=$p
  done < 'exam7.lock'
  kill -15 $PID
  exit 0
}

job_running(){
  i=0
  while [ $i -lt 20 ]; do
    trap "stop_exam7" 2 15
    true; 
    i=`expr $i + 1`
    echo $i >> output_$$.txt
    sleep 1;
  done
}

if [ $1 = 'start' ];
then
  if [ -f 'exam7.lock' ];
  then
    echo "already running"
    exit 0
  else
    echo $$ > exam7.lock
    job_running
    exit 0
  fi
elif [ $1 = 'stop' ];
then
  if [ -f 'exam7.lock' ];
  then  # ジョブを終了
    stop_exam7
  else
    echo "Not running"
    exit 0
  fi
elif [ $1 = 'status' ];
then 
  if [ -f 'exam7.lock' ];
  then  # 既にジョブが実行中
    PID=-1
    while read p;
    do
      PID=$p
    done < 'exam7.lock'
    echo Process is running pid=$PID
  else
    echo 'Process is not running'
  fi
else
  echo 'wrong argument'
  exit 1 
fi