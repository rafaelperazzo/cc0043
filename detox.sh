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
#INÍCIO
PACOTE=projetoauladetox
sed -i "s/avdName:.*/avdName: 'android_react'/g" .detoxrc.js 
sed -i "9i kotlinVersion = '1.7.21'" android/build.gradle
sed -i "21i classpath(\"org.jetbrains.kotlin:kotlin-gradle-plugin:\$kotlinVersion\")" android/build.gradle

sed -i "23i allprojects{\n\t repositories {\n\t google() \n\t  maven {\n\t\t url(\"\$rootDir/../node_modules/detox/Detox-android\")\n\t } \n\t maven { url 'https://www.jitpack.io' }\n\t }\n}" android/build.gradle
#sed -i "51i maven {\n url(\"\$rootDir/../node_modules/detox/Detox-android\")\n }" android/build.gradle

sed -i "103i testBuildType System.getProperty('testBuildType', 'debug')" android/app/build.gradle
sed -i "104i testInstrumentationRunner 'androidx.test.runner.AndroidJUnitRunner'" android/app/build.gradle
sed -i "133i proguardFile \"\${rootProject.projectDir}/../node_modules/detox/android/detox/proguard-rules-app.pro\"" android/app/build.gradle
sed -i "155i androidTestImplementation('com.wix:detox:+')" android/app/build.gradle
sed -i "156i implementation 'androidx.appcompat:appcompat:1.1.0'" android/app/build.gradle
rm -R -f android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
mkdir -p android/app/src/androidTest/java/com/$PACOTE/
touch android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
echo "package com.$PACOTE;" >> android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
cat javafile.txt >> android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
#cat android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
rm -R -f android/app/src/main/res/xml/network_security_config.xml
mkdir -p android/app/src/main/res/xml/
touch android/app/src/main/res/xml/network_security_config.xml
cat config.txt >> android/app/src/main/res/xml/network_security_config.xml
sed -i "24i android:networkSecurityConfig=\"@xml/network_security_config\">" android/app/src/main/AndroidManifest.xml
detox build --configuration android.emu.debug