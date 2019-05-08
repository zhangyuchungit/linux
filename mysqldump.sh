#!/bin/sh
#此脚本为1week运行一次，每次运行完成之后删除之前的
#1 1 * * *  /root/script/mysqldump.sh >/root/script/mysqldump.log 2>&1
#set -x
#此脚本更改arry组中的数据库名即可,
array=(chayu_0915)
now_date=`date +%Y%m%d`
old_date=`date +%Y%m%d --date="-1 week"`
order_mysql="/usr/bin/mysqldump -uroot -p**** -h192.168.40.241 -B --single-transaction"
dir_mysql="/data/mysql/backup"
echo "当前时间:$now_date"
[ -d $mysql_dir ] &&{
   /bin/mkdir -p $dir_mysql	
}
for i in ${array[@]}
  do
  ${order_mysql} $i |gzip > $dir_mysql/${i}_${now_date}.sql.gz;
  /bin/rm -rf $dir_mysql/${i}_${old_date}.sql.gz
done

