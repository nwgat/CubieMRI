# nwgat.ninja
# http://github.com/nwgat
# all-in-one should work on both raspberry and cubie/banana
# WORK IN PROGRESS / NOT WORKING
ip=$(hostname -I)

# install java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get update
apt-get install oracle-java7-installer librxtx-java supervisor -y

echo "[program:jmri]
user=cubie
directory=/home/cubie
priority=2
command=/home/cubie/JMRI/JmriFaceless
redirect_stderr=true
startsecs=5" > /etc/supervisor/conf.d/jmri.conf

echo "[inet_http_server] 
port=*:80" >> /etc/supervisor/supervisord.conf

# install jmri
cd $HOME && curl -L http://sourceforge.net/projects/jmri/files/production%20files/JMRI.3.10.1-r28327.tgz > /home/cubie/JMRI.tgz
cd /home/cubie/ && tar xvf JMRI.tgz
chown cubie:cubie -R /home/cubie/
ln -s /usr/lib/jvm/java-7-oracle/jre/lib/librxtxSerial.so $HOME/JMRI/lib/librxtxSerial.so

# details
echo "<<< Service Control WebUI >>>"
echo "http://$ip"
echo "config files on SFTP: $ip:22"
echo "all done"
