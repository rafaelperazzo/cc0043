# Instalar KVM
 ```console
$ apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
 ```
 * https://developer.android.com/studio/run/emulator-acceleration?hl=pt-br

# Instalar o node

```console
$ cd /opt
$ tar xvf node-v18.13.0-linux-x64.tar.xz
$ mv node-v18.13.0-linux-x64 node-latest
```

# Colocar o node no PATH
```console
$ echo 'PATH="$PATH:/opt/node-latest"; export path' >> /etc/profile
```
# Instalar webstorm 
```console
$ tar xvzf webstorm.tar.gz
$ mv Webstorm webstorm-latest
```

# Instalar o android sdk
```console
$ mv cmdline-tools android_sdk
$ cd android_sdk/cmdline-tools
$ mkdir latest
$ mv * latest
$ cd latest/bin
$ ./sdkmanager "system-images;android-31;default;x86_64"
$ ./sdkmanager "system-images;android-31;google_apis;x86_64"
$ ./sdkmanager "build-tools;31.0.0" "ndk-bundle" "platform-tools" "platforms;android-31" "tools"
```
# Listar SDKs instalados

```console
$ sdkmanager --list_installed
```

# Colocar o Android SDK no PATH -> No final do arquivo /etc/profile

```console
export ANDROID_HOME=/opt/android_sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME 
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/android_sdk/cmdline-tools/latest/bin
```

# Listar AVDs disponíveis

```console
$ emulator -list-avds
ou
$ avdmanager list
```

# Criar uma AVD

```console
$ mkdir /shared/seuusername
$ avdmanager -v create avd -f -n android_react -k "system-images;android-31;google_apis;x86_64" -c 2000M -p /shared/seuusername
```

# Iniciando o emulador

```console
$ emulator -avd android_react
```

# Atualizar pacotes
```console
$ sdkmanager --update
```

# Desabilitar o IPV6
* https://www.itzgeek.com/how-tos/linux/debian/how-to-disable-ipv6-on-debian-9-ubuntu-16-04.html

```console
$ echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
ou
$ echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf
ou 
$ echo 'net.ipv6.conf.eno1.disable_ipv6 = 1' >> /etc/sysctl.conf
$ sysctl -p
```