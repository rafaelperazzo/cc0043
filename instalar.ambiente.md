# Preparando seu ambiente Linux

## Pré-requisitos

* Como root: Instalar o openjdk-11 e desabilitar o IPv6

```console
apt-get install openjdk-11-jre openjdk-11-jdk unzip
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
sysctl -p
```

## 1. Instalar o node

```console
cd /opt
wget https://nodejs.org/dist/v18.14.0/node-v18.14.0-linux-x64.tar.xz
tar xvf node-v18.14.0-linux-x64.tar.xz
mv node-v18.14.0-linux-x64 node-latest
```

## 2. Colocar o node no PATH

```console
echo "export PATH=$PATH:/opt/node-latest/bin" >> /etc/profile
echo "export PATH=$PATH:/opt/node-latest/bin" >> /etc/bash.bashrc
```

## 3. Instalar webstorm

```console
mv /etc/apt/preferences.d/nosnap.pref ~/root/nosnap.backup
apt update
apt install snapd
snap install webstorm --classic
```

## 4. Instalar o android sdk

* Baixar o commandline-tools na seção de download do android studio
* <https://developer.android.com/studio>

```console
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
```

## 5. Colocar o SDK do Android no PATH

```console
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
```

## 6. Reiniciar a máquina

## 7. Criar uma AVD

* Considerando que você está usando uma máquina do Lab K05-s.

```console
mkdir /shared/seuusername
avdmanager -v create avd -f -n android_react -k "system-images;android-31;google_apis;x86_64" -c 2000M -p /shared/seuusername
```

## 8. Listar SDKs instalados

```console
sdkmanager --list_installed
```

## 9. Listar AVDs disponíveis

```console
$ emulator -list-avds
ou
$ avdmanager list
```

## 10. Iniciando o emulador

```console
emulator -avd android_react
```

## 11. Atualizar pacotes

```console
sdkmanager --update
```

## Outras informações

## Habilitando os botões no Emulador

* Considerando que o AVD foi instalado em /share/seunomeusuario:

```console
sed -i 's/hw.keyboard=no/hw.keyboard=yes/g' /share/seunomeusuario/avd/config.ini
```

![Imagem](https://i.stack.imgur.com/yjdw8.jpg)

### Desabilitar o IPV6

* <https://www.itzgeek.com/how-tos/linux/debian/how-to-disable-ipv6-on-debian-9-ubuntu-16-04.html>

```console
$ echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
ou
$ echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf
ou 
$ echo 'net.ipv6.conf.eno1.disable_ipv6 = 1' >> /etc/sysctl.conf
$ sysctl -p
```

### Instalar KVM (opcional)

 ```console
apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
 ```

* <https://developer.android.com/studio/run/emulator-acceleration?hl=pt-br>

### Adicionar usuário ao grupo kvm

```console
gpasswd -a joao kvm
```

### Reabilitando o IPv6

```console
sed 's/net.ipv6.conf.lo.disable_ipv6 = 1/net.ipv6.conf.lo.disable_ipv6 = 0/g' /etc/sysctl.conf
```

## Extensões úteis para o VsCode

* React Native Tools
* Babel JavaScript
* Flow Language Support
* ESLint
* Prettier – Code formatter
* Auto Close Tag/Auto Complete Tag/Auto Rename Tag
* Color Highlight
* Git Blame
* TO DO Highlight
* Bracket Pair Colorizer
* markdownlint
* Settings Sync
* Search node_modules
* npm Intellisense
* Code Spell Checker
* change-case
* Brazilian Portuguese - Code Spell Checker

* <https://www.developers-zone.com/best-way-to-create-react-native-app-in-visual-studio-code/#:~:text=At%20the%20very%20first%20before,able%20to%20debug%20your%20code.>

## Fonte Jetbrains Mono

* Como root, baixe o arquivo zip de fontes

```console
cd /opt
mkdir jetbrains_fonts
cd jetbrains_fonts
wget -O JetBrainsMono-2.304.zip https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip
cd fonts
cp -R * /usr/share/fonts
fc-cache -f -v
```

> <https://www.jetbrains.com/lp/mono/#how-to-install>

## VsCode -> Português

* Instale a extensão Brazilian Portuguese Language Pack
* Nas configurações (Arquivo - Configurações) ou (File - Settings) procure por cSpell.language e coloque "en,PT_BR"

[Referência](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-portuguese-brazilian)

## OUTRAS INFORMAÇÕES

> Testado no Linux Mint 21. Deve funcionar em outras distribuições baseadas em Ubuntu/ Debian
> Data: Fevereiro/2023
> Baixar script: [SHELL SCRIPT](https://raw.githubusercontent.com/rafaelperazzo/cc0043/master/install.node.sh)
