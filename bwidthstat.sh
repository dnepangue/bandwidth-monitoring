#!/bin/bash

EMAIL=dnepangue@gmail.com
date=$(date +'%m/%d/%Y')
ctime=$(date +"%r")
tom=$(TZ=PHT-24 date +%d)
host=$(hostname)

vnstat -u

dRX=$(vnstat -d | grep `date +%m/%d/%y`| awk '{print $2 $3}')
dTX=$(vnstat -d | grep `date +%m/%d/%y`| awk '{print $5 $6}')
dAR=$(vnstat -d | grep `date +%m/%d/%y`| awk '{print $11 $12}')
dTB=$(vnstat -d | grep `date +%m/%d/%y`| awk '{print $8 $9}')

mTX=$(vnstat -m -i eth0 | grep `date | cut -d' ' -f2` | awk '{print $6 $7}')
mRX=$(vnstat -m -i eth0 | grep `date | cut -d' ' -f2` | awk '{print $3 $4}')
mAR=$(vnstat -m -i eth0 | grep `date | cut -d' ' -f2` | awk '{print $12 $13}')
mTB=$(vnstat -m -i eth0 | grep `date | cut -d' ' -f2` | awk '{print $9 $10}')

if [ $tom -eq 1 ]; then

  report=$(vnstat -m | grep `date | cut -d' ' -f2`> /tmp/stat.txt)
  usage=$(cat /tmp/stat.txt)
  MSG="\n\n Monthly Bandwidth Summary for $host \n\n"
  MSG="$MSG Date : $date\n"
  MSG="$MSG Time : $ctime\n"
  MSG="$MSG Host : $host\n"
  MSG="$MSG Download : $mRX \n"
  MSG="$MSG Upload : $mTX \n"
  MSG="$MSG Total : $mTB\n"
  MSG="$MSG Average Rate : $mAR\n\n"
  MSG="$MSG ==Report== \n\n $usage"

else

  report=$(vnstat -d | grep `date +%m/%d/%y`> /tmp/stat.txt)
  usage=$(cat /tmp/stat.txt)
  MSG="\n\n Daily Bandwidth Summary for $host \n\n"
  MSG="$MSG Date : $date\n"
  MSG="$MSG Time : $ctime\n"
  MSG="$MSG Host : $host\n"
  MSG="$MSG Download : $dRX \n"
  MSG="$MSG Upload : $dTX \n"
  MSG="$MSG Total : $dTB\n"
  MSG="$MSG Average Rate : $dAR\n\n"
  MSG="$MSG ==Report== \n\n $usage"

fi

echo -e "$MSG"  | mail -s "[$host]: Bandwidth Report" -r "$host@exist.com ($host)" "$EMAIL"
