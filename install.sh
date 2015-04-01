# Nwgat.Net
# http://github.com/nwgat
# for Cubieez Linux ARM Distribution
# WORK IN PROGRESS / NOT WORKING

JMRI_URL=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 5,6 | cut -d " " -f 2 | cut -d '"' -f 2)
JMRI_PACKAGE_NAME=$(curl -s http://jmri.org/releaselist -o - | tr '\n' ' ' | cut -d ":" -f 6 | cut -d "/" -f 8)
WORKING_DIR=$(pwd)
ip=$(hostname -I)

# install java
apt-get update -y
apt-get install software-properties-common python-software-properties -y
add-apt-repository ppa:webupd8team/java -y
apt-get install oracle-java7-installer librxtx-java -y

# install jmri 
wget -O $JMRI_PACKAGE_NAME "$JMRI_URL"
tar zxvf $HOME/$JMRI_PACKAGE_NAME
#ln -l /usr/lib/jvm/java-7-oracle/jre/lib/librxtxSerial.so /usr/lib/jni/librxtxSerial.so
ln -s /usr/lib/jni/librxtxSerial.so /usr/lib/jvm/java-7-oracle/jre/lib/librxtxSerial.so

# setting it up
echo "su cubie -c "screen -dmS -X /home/cubie/Desktop/JMRI/JmriFaceless"" >
ln -s /$HOME/.jmri/PanelProConfig2.xml /home/$user/.jmri/JmriFacelessConfig3.xml 
echo "SUBSYSTEMS=="usb", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="ff7e", GROUP="users", MODE="0666"" > /etc/udev/rules.d/51-digitrax

echo "[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=PanelPro
Exec=/$HOME/JMRI/PanelPro
Icon=
p" >> /$HOME/Desktop/PanelPro.desktop

echo "[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=DecoderPro
Exec=/$HOME/JMRI/DecoderPro
Icon=" > /home/$user/Desktop/DecoderPro.desktop

# details
echo "Details"
echo "VNC: $ip:5900"
echo "all done"

# misc
http://www.penguintutor.com/linux/tightvnc
startlubuntu &