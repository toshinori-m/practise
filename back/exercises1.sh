# !/bin/bash
echo -n "年齢（半角数字で入力）=> "
read age
echo -n "性別（man, womanで入力）=> "
read gender
if test -z $gender || [ -z $age ] ; then  # 空白時
  echo "exit 1" # 空白時
else 
  if [ $age -ge 0 ] && [ $age -lt 20 ] ; then  # ageが0以上20未満
    age_selection="Child"
  elif [ $age -ge 20 ] && [ $age -lt 60 ] ; then  # ageが20以上60未満
    age_selection="Adult"
  elif [ $age -ge 60 ] ; then  # ageが60以上
    age_selection="Elderly"
  else
    echo "exit 1" # 空白時
    exit
  fi
  if test $gender = "man" ; then  # manと等しい
    gender_selection="Man"
  elif test $gender = "woman" ; then  # womanと等しい
    gender_selection="Woman"
  else
    echo "exit 1" # 空白時
    exit
  fi
    selection=$gender_selection:$age_selection
    echo $selection
fi