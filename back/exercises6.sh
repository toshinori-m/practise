# !/bin/bash
echo "for文使用作成"
for i in $(seq 100) ; do
  r3=`expr $i % 3`
  r5=`expr $i % 5`
  if [ $r3 -eq 0 ] && [ $r5 -eq 0 ] ; then  # iが3の倍数かつ5の倍数
    echo "Fizz,Buzz"
  elif [ $r3 -eq 0 ] ; then  # iが3の倍数(かつ、5の倍数でない)
    echo "Fizz"
  elif [ $r5 -eq 0 ] ; then  # iが5の倍数(かつ、3の倍数でない)
    echo "Buzz"
  else  # iが3の倍数でも5の倍数でもない
    echo $i
  fi
done

# for i in $(seq 1 100)
# do
#   if (( $i % 3 == 0 && $i % 5 == 0 ))
#   then
#     echo "FizzBuzz"
#   else if (( $i % 3 == 0))
#     then
#       echo "Fizz"
#     else if (( $i % 5 == 0 ))
#       then
#         echo "Buzz"
#       else
#       echo $i
#       fi
#     fi
#   fi
#   sleep 1
# done

echo "while文使用作成"
count=1
while [ ${count} -le 100 ]; do
  r3=`expr $count % 3`
  r5=`expr $count % 5`
  if [ $r3 -eq 0 ] && [ $r5 -eq 0 ] ; then  # iが3の倍数かつ5の倍数
    echo "Fizz,Buzz"
  elif [ $r3 -eq 0 ] ; then  # iが3の倍数(かつ、5の倍数でない)
    echo "Fizz"
  elif [ $r5 -eq 0 ] ; then  # iが5の倍数(かつ、3の倍数でない)
    echo "Buzz"
  else  # iが3の倍数でも5の倍数でもない
    echo $count
  fi
  count=$(expr ${count} + 1)
done

echo "until文使用作成"
COUNTER=1
until [ ${COUNTER} -gt 100 ]; do
  r3=`expr $COUNTER % 3`
  r5=`expr $COUNTER % 5`
  if [ $r3 -eq 0 ] && [ $r5 -eq 0 ] ; then  # iが3の倍数かつ5の倍数
    echo "Fizz,Buzz"
  elif [ $r3 -eq 0 ] ; then  # iが3の倍数(かつ、5の倍数でない)
    echo "Fizz"
  elif [ $r5 -eq 0 ] ; then  # iが5の倍数(かつ、3の倍数でない)
    echo "Buzz"
  else  # iが3の倍数でも5の倍数でもない
    echo $COUNTER
  fi
  COUNTER=$(expr ${COUNTER} + 1)
done