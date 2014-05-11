# Nwgat.Net
# http://github.com/nwgat
# WORK IN PROGRESS / NOT WORKING

JMRI_URL=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 5,6 | cut -d " " -f 2 | cut -d '"' -f 2)
JMRI_PACKAGE_NAME=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 6 | cut -d "/" -f 8)
WORKING_DIR=$(pwd)
ip=$ip
# java
echo "installing Java"
echo "" >>


# jmri 
wget -O $JMRI_PACKAGE_NAME "$JMRI_URL"
tar zxvf $JMRI_PACKAGE_NAME

apt-get install oracle-java7-installer librxr

cp /usr/lib/jni/librxtxSerial.so $JAVA_HOME/jre/lib/i386/


