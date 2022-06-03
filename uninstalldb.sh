dbtype=$1;
if [ "$dbtype" = "mongo" ]
  then
    pkill mongod;
    while [ ture ]
    do
     if pgrep -x "mongod" > /dev/null; then
       echo "************MongoD Process Running************";
       sleep 5;
     else
       echo "***********purging mongodb packages******************";
       sudo apt-get purge mongodb-org* -y --allow-change-held-packages;
       echo "***************removing  mongodb packages*****************";
       sudo apt autoremove -y;
       echo "*****************deleting mongodb directories****************";
       sudo rm -rf /var/log/mongodb;
       sudo rm -rf /var/lib/mongo*;
       sudo rm -f /etc/apt/sources.list.d/mongodb-org-5.0.list;
       sudo rm -rf /var/lib/mongokey;
       exit;
    fi;
  done;
elif [ "$dbtype" = "mysql" ]
  then
    echo "*****apt-get remove --purge mysql*";
    sudo apt-get remove -y --purge mysql*;
    echo "*****apt-get purge mysql*";
    sudo apt-get purge mysql*;
    echo "*****apt-get autoremove";
    sudo apt-get autoremove -y;
    echo "*****apt-get autoclean";
    sudo apt-get autoclean;
    echo "*****apt-get remove dbconfig-mysql"
    sudo apt-get remove dbconfig-mysql;

    sudo rm -rf /var/lib/mysql*;
else
  echo "Invalid DB Type, Please select mongo or mysql.";
fi;
