installtype=$1
if [ "$installtype" = "mongo" ]
  then
    sudo unzip -o /tmp/mongo.zip;
    sudo chown -R jenkins:jenkins mongo
    sudo chmod -R 775 mongo
    cp -r /var/lib/jenkins/workspace/param-pipe/mongo /tmp/
    sudo sh /tmp/getservers.sh;
    rm -f /tmp/getservers.sh;
    rm -f /tmp/startmongoinstance.sh;
    rm -f /tmp/scp_ncb.sh;
    rm -f /tmp/ssh_ncb.sh;
    rm -f /tmp/initiaterepl.sh;
    rm -f /tmp/uninstall.sh
    echo " " >> /tmp/mongodbinstallation.log;
    echo "*************************************************************************" >> /tmp/mongodbinstallation.log;
    echo " " >> /tmp/mongodbinstallation.log;
    echo "Please use below script to start and stop mongoDB Services." >> /tmp/mongodbinstallation.log;
    echo " " >> /tmp/mongodbinstallation.log; 
    echo "To start MongoDB Service:" >> /tmp/mongodbinstallation.log;
    echo "sudo mongod --auth --port 27017 --dbpath /var/lib/mongo --logpath /var/log/mongodb/mongod.log --replSet rep0 --fork --keyFile /var/lib/mongokey/key --bind_ip <Host_IP>" >> /tmp/mongodbinstallation.log;
    echo " " >> /tmp/mongodbinstallation.log;
    echo "To stop MongoDB Service:" >> /tmp/mongodbinstallation.log;
    echo "pkill mongod" >> /tmp/mongodbinstallation.log;
    echo " " >> /tmp/mongodbinstallation.log;
    echo "To start MongoDB Instance:" >> /tmp/mongodbinstallation.log;
    echo "sudo mongo -u aduser -p aduser ----authenticationDatabase admin --host <Host_IP>" >> /tmp/mongodbinstallation.log;
elif [ "$installtype" = "mysql" ] 
  then
    sudo unzip -o /tmp/instfiles.zip;
    sudo sh /tmp/getservers.sh;
    rm -f /tmp/getservers.sh;
    rm -f /tmp/scp_ncb.sh;
    rm -f /tmp/ssh_ncb.sh;
    rm -f /tmp/initiaterepl.sh;
#Testing
else
  echo "Invalid Installation type, Please select mongo or mysql";
fi;
