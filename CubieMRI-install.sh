# nwgat.ninja
# http://github.com/nwgat
# all-in-one should work on both raspberry and cubie/banana
# WORK IN PROGRESS / NOT WORKING
ip=$(hostname -I)

what user to install jmri to? (cubie etc)
read usr

# install java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get update
apt-get install oracle-java7-installer librxtx-java supervisor -y

echo "[program:jmri]
user=$usr
directory=/home/$usr
priority=2
command=/home/$usr/JMRI/JmriFaceless
redirect_stderr=true
startsecs=5" > /etc/supervisor/conf.d/jmri.conf

echo "[inet_http_server] 
port=*:80" >> /etc/supervisor/supervisord.conf

# install jmri
cd $HOME && curl -L http://sourceforge.net/projects/jmri/files/production%20files/JMRI.3.10.1-r28327.tgz > /home/$usr/JMRI.tgz
cd /home/$usr/ && tar xvf JMRI.tgz
chown $usr:$usr -R /home/$usr/
ln -s /usr/lib/jvm/java-7-oracle/jre/lib/librxtxSerial.so $HOME/JMRI/lib/librxtxSerial.so

# details
echo "<<< Service Control WebUI >>>"
echo "http://$ip"
echo "config files on SFTP: $ip:22"
echo "path is /home/$usr/.jmri"
