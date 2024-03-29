#Fonte: https://wix.github.io/Detox/docs/introduction/project-setup
#Data: 17/05/2023
#Step 1: Bootstrap
npm install detox-cli --global
npm install "jest@^29" --save-dev
npm install detox --save-dev
detox init
#RESTURANDO ARQUIVOS
cp .detoxrc.js.old .detoxrc.js
cp android/build.gradle.old android/build.gradle
cp android/app/build.gradle.old android/app/build.gradle
cp android/app/src/main/AndroidManifest.xml.old android/app/src/main/AndroidManifest.xml
#BACKUP DOS ARQUIVOS
cp .detoxrc.js .detoxrc.js.old
cp android/build.gradle android/build.gradle.old
cp android/app/build.gradle android/app/build.gradle.old
cp android/app/src/main/AndroidManifest.xml android/app/src/main/AndroidManifest.xml.old
#Baixando arquivos auxiliares
wget https://raw.githubusercontent.com/rafaelperazzo/cc0043/master/config.txt
wget https://raw.githubusercontent.com/rafaelperazzo/cc0043/master/javafile.txt
#INÍCIO
#Step 3: Device configs
PACOTE="$($echo ls android/app/src/main/java/com/)"
sed -i "s/avdName:.*/avdName: 'android_react'/g" .detoxrc.js 
#Step 4.1: Patching build scripts
linha=$(grep -n "targetSdkVersion" android/build.gradle | cut -d : -f 1)
linha=$((linha+1))
sed -i "${linha}i kotlinVersion = '1.7.21'" android/build.gradle
linha=$(grep -n "com.facebook.react:react-native-gradle-plugin" android/build.gradle | cut -d : -f 1)
linha=$((linha+1))
sed -i "${linha}i classpath(\"org.jetbrains.kotlin:kotlin-gradle-plugin:\$kotlinVersion\")" android/build.gradle
linha=$(grep -n "org.jetbrains.kotlin:kotlin-gradle-plugin" android/build.gradle | cut -d : -f 1)
linha=$((linha+1))
sed -i "${linha}i allprojects{\n\t repositories {\n\t google() \n\t  maven {\n\t\t url(\"\$rootDir/../node_modules/detox/Detox-android\")\n\t } \n\t maven { url 'https://www.jitpack.io' }\n\t }\n}" android/build.gradle
linha=$(grep -n "versionName \"1.0\"" android/app/build.gradle | cut -d : -f 1)
linha=$((linha+1))
sed -i "${linha}i testBuildType System.getProperty('testBuildType', 'debug')" android/app/build.gradle
linha=$((linha+1))
sed -i "${linha}i testInstrumentationRunner 'androidx.test.runner.AndroidJUnitRunner'" android/app/build.gradle
linha=$(grep -n "proguardFiles getDefaultProguardFile" android/app/build.gradle | cut -d : -f 1)
linha=$((linha+1))
sed -i "${linha}i proguardFile \"\${rootProject.projectDir}/../node_modules/detox/android/detox/proguard-rules-app.pro\"" android/app/build.gradle
linha=$(grep -n "dependencies {" android/app/build.gradle | cut -d : -f 1)
linha=$((linha+1))
sed -i "${linha}i androidTestImplementation('com.wix:detox:+')" android/app/build.gradle
linha=$((linha+1))
sed -i "${linha}i implementation 'androidx.appcompat:appcompat:1.1.0'" android/app/build.gradle
#Step 4.2. Adding an auxiliary Android test
rm -R -f android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
mkdir -p android/app/src/androidTest/java/com/$PACOTE/
touch android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
echo "package com.$PACOTE;" >> android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
cat javafile.txt >> android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
#Step 4.3. Enabling unencrypted traffic for Detox
rm -R -f android/app/src/main/res/xml/network_security_config.xml
mkdir -p android/app/src/main/res/xml/
touch android/app/src/main/res/xml/network_security_config.xml
cat config.txt >> android/app/src/main/res/xml/network_security_config.xml
linha=$(grep -n "</application>" android/app/src/main/AndroidManifest.xml | cut -d : -f 1)
sed -i "${linha}i android:networkSecurityConfig=\"@xml/network_security_config\">" android/app/src/main/AndroidManifest.xml
#Step 5: Build the app
detox build --configuration android.emu.debug
