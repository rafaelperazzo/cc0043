apt-get install openjdk-11-jre openjdk-11-jdk
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
sysctl -p
cd /opt
wget https://nodejs.org/dist/v18.14.0/node-v18.14.0-linux-x64.tar.xz
tar xvf node-v18.13.0-linux-x64.tar.xz
cd node-v18.13.0-linux-x64
mv node-v18.13.0-linux-x64 node-latest
echo 'export PATH=$PATH:/opt/node-latest/bin' >> /etc/profile
echo 'export PATH=$PATH:/opt/node-latest/bin' >> /etc/bash.bashrc

cd /opt
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-9477386_latest.zip
mkdir /opt/android_sdk
mv cmdline-tools android_sdk
cd android_sdk/cmdline-tools
mkdir latest
mv * latest
cd latest/bin
./sdkmanager "system-images;android-31;google_apis;x86_64"
./sdkmanager "build-tools;31.0.0" "ndk-bundle" "platform-tools" "platforms;android-31" "tools"
echo 'export ANDROID_HOME=/opt/android_sdk' >> /etc/profile
echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME' >> /etc/profile
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> /etc/profile
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> /etc/profile
echo 'export PATH=$PATH:/opt/android_sdk/cmdline-tools/latest/bin' >> /etc/profile
echo 'export ANDROID_HOME=/opt/android_sdk' >> /etc/bash.bashrc
echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME' >> /etc/bash.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> /etc/bash.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> /etc/bash.bashrc
echo 'export PATH=$PATH:/opt/android_sdk/cmdline-tools/latest/bin' >> /etc/bash.bashrc

#WEBSTORM
mv /etc/apt/preferences.d/nosnap.pref ~/root/nosnap.backup
apt update
apt install snapd
snap install webstorm --classic