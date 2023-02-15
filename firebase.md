# Projeto com Firebase

## 1. Iniciar

```console
npx react-native init NOME_DO_PROJETO --version 0.68.2
cd NOME_DO_PROJETO
npm install --save @react-native-firebase/app
npm install --save @react-native-firebase/auth
npm install --save @react-native-firebase/database
```

## 2. Gerar o debug signing

```
cd PASTA_DO_SEU_PROJETO
cd android && ./gradlew
Anote o SHA1 do debugAndroidTest
```

## 3. Criar o projeto no firebase

```
- Na visão geral do projeto clicar em Adicionar app e selecionar android. Cole o SHA1 do passo anterior.

- Baixe o google-services.json em NOME_DO_PROJETO/android/app
```

## 4. Adicionar SDK do firebase

```
No arquivo NOME_DO_PROJETO/android/build.gradle adicione nas dependencias:

classpath 'com.google.gms:google-services:4.3.15'

Em seguida adicione  no arquivo NOME_DO_PROJETO/android/app/build.gradle

apply plugin: 'com.google.gms.google-services'
```

## 5. Abra seu projeto no WebStorm

## 6. Inicie o metro

```console
npx react-native start

```

## 7. Inicie o emulador

```console
emulator -avd android_react
```

## 8. Inicie seu app

```console
npx react-native run-android

```