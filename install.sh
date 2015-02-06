# nwgat.ninja
# http://github.com/nwgat
# all-in-one should work on both raspberry and cubie/banana
# WORK IN PROGRESS / NOT WORKING

JMRI_URL=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 5,6 | cut -d " " -f 2 | cut -d '"' -f 2)
JMRI_PACKAGE_NAME=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 6 | cut -d "/" -f 8)
WORKING_DIR=$(pwd)
ip=$(hostname -I)

# install java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get update
apt-get install oracle-java7-installer librxtx-java -y

# install jmri 
wget -O $JMRI_PACKAGE_NAME "$JMRI_URL"
tar zxvf $JMRI_PACKAGE_NAME
ln -l /usr/lib/jvm/java-7-oracle/jre/lib/librxtxSerial.so /home/jmri/JMRI/lib/librxtxSerial.so

# setting it up

# details
echo "Details"
echo "Supervisord WebUI:" 
echo "http://$ip:9001"
echo "config files on SFTP: $ip:22"
echo "all done"
