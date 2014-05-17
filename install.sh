# Nwgat.Net
# http://github.com/nwgat
# for Cubieez Linux ARM Distribution
# WORK IN PROGRESS / NOT WORKING

JMRI_URL=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 5,6 | cut -d " " -f 2 | cut -d '"' -f 2)
JMRI_PACKAGE_NAME=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 6 | cut -d "/" -f 8)
WORKING_DIR=$(pwd)
ip=$(hostname -I)

# install java
apt-get install oracle-java7-installer librxtx

# install jmri 
wget -O $JMRI_PACKAGE_NAME "$JMRI_URL"
tar zxvf $JMRI_PACKAGE_NAME
ln -l /usr/lib/jvm/java-7-oracle/jre/lib/librxtxSerial.so /home/jmri/JMRI/lib/librxtxSerial.so

# setting it up
echo "su cubie -c "screen -dmS -X /home/jmri/JMRI/JmriFaceless"" >>


# details
echo "Details"
echo "VNC: $ip:5900"
echo "all done"
