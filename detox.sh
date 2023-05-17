#npm install detox-cli --global
#npm install "jest@^29" --save-dev
#npm install detox --save-dev
#detox init
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
sed -i "9i kotlinVersion = 'X.Y.Z'" android/build.gradle
sed -i "20i classpath(\"org.jetbrains.kotlin:kotlin-gradle-plugin:\$kotlinVersion\")" android/build.gradle
sed -i "49i maven {\n url(\"\$rootDir/../node_modules/detox/Detox-android\")\n }" android/build.gradle
sed -i "143i testBuildType System.getProperty('testBuildType', 'debug')" android/app/build.gradle
sed -i "144i testInstrumentationRunner 'androidx.test.runner.AndroidJUnitRunner'" android/app/build.gradle
sed -i "231i proguardFile \"\${rootProject.projectDir}/../node_modules/detox/android/detox/proguard-rules-app.pro\"" android/app/build.gradle
sed -i "252i androidTestImplementation('com.wix:detox:+')" android/app/build.gradle
sed -i "253i implementation 'androidx.appcompat:appcompat:1.1.0'" android/app/build.gradle
rm -R -f android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
mkdir -p android/app/src/androidTest/java/com/$PACOTE/
touch android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
echo "package com.$PACOTE;" >> android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
cat javafile.txt >> android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
cat android/app/src/androidTest/java/com/$PACOTE/DetoxTest.java
rm -R -f android/app/src/main/res/xml/network_security_config.xml
mkdir -p android/app/src/main/res/xml/
touch android/app/src/main/res/xml/network_security_config.xml
cat config.txt >> android/app/src/main/res/xml/network_security_config.xml
sed -i "24i android:networkSecurityConfig=\"@xml/network_security_config\">" android/app/src/main/AndroidManifest.xml
detox build --configuration android.emu.debug