# Passo 1: Desabilitar o IPv6

* https://www.itzgeek.com/how-tos/linux/debian/how-to-disable-ipv6-on-debian-9-ubuntu-16-04.html

```console
$ echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
ou
$ echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf
ou 
$ echo 'net.ipv6.conf.eno1.disable_ipv6 = 1' >> /etc/sysctl.conf
$ sysctl -p
```

# PASSO 2: Instalar o NodeJs

```console
$ cd /opt
$ wget https://nodejs.org/dist/v18.14.0/node-v18.14.0-linux-x64.tar.xz
$ tar xvf node-v18.13.0-linux-x64.tar.xz
$ cd node-v18.13.0-linux-x64
$ mv node-v18.13.0-linux-x64 node-latest
$ echo 'export PATH=$PATH:/opt/node-latest/bin' >> /etc/profile
$ echo 'export PATH=$PATH:/opt/node-latest/bin' >> /etc/bash.bashrc
```
# PASSO 3: Instalar o commandline-tools

```console
$ cd /opt
$ wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
$ unzip commandlinetools-linux-9477386_latest.zip
$ mkdir /opt/android_sdk
$ mv cmdline-tools android_sdk
$ cd android_sdk/cmdline-tools
$ mkdir latest
$ mv * latest
$ cd latest/bin
```

# PASSO 4: Instalar o SDK do Android

```console
$ cd /opt/android_sdk/cmdline-tools/latest/bin
$ ./sdkmanager "system-images;android-31;google_apis;x86_64"
$ ./sdkmanager "build-tools;31.0.0" "ndk-bundle" "platform-tools" "platforms;android-31" "tools"
$ echo 'export ANDROID_HOME=/opt/android_sdk' >> /etc/profile
$ echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME' >> /etc/profile
$ echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> /etc/profile
$ echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> /etc/profile
$ echo 'export PATH=$PATH:/opt/android_sdk/cmdline-tools/latest/bin' >> /etc/profile
$ echo 'export ANDROID_HOME=/opt/android_sdk' >> /etc/bash.bashrc
$ echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME' >> /etc/bash.bashrc
$ echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> /etc/bash.bashrc
$ echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> /etc/bash.bashrc
$ echo 'export PATH=$PATH:/opt/android_sdk/cmdline-tools/latest/bin' >> /etc/bash.bashrc
```

# PASSO 5: Instalar o WebStorm

* O primeiro comando apenas se a distribuição for o Linux Mint

```console
$ mv /etc/apt/preferences.d/nosnap.pref ~/root/nosnap.backup
$ apt update
$ apt install snapd
$ snap install webstorm --classic
```

# PASSO 6: Reiciar a máquina ou encerrar a sessão

> Testado no linux Mint 21. Deve funcionar em outras distribuições baseadas em Ubuntu/ Debian 

> Data: Fevereiro/2023
