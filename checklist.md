# Checklist

## Emulador está funcionando ?

* Abrir o terminal e digitar o comando:

```console
emulator -list-avds
```

* Anote o nome do AVD instalado, e caso não exista nenhum, criar um novo:

```console
mkdir /shared/seuusername
avdmanager -v create avd -f -n android_react -k "system-images;android-31;google_apis;x86_64" -c 2000M -p /shared/seuusername
```

* Iniciar o emulador

```console
emulator -avd android_react
```

## Verificar se as extensões estão instaladas no VsCode

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
* Search node_modules
* npm Intellisense
* Code Spell Checker
* change-case
* Brazilian Portuguese - Code Spell Checker

## Verificar se o node está instalado

```console
node --version
```

## Crie sua conta da Jetbrains

* [https://www.jetbrains.com/shop/eform/students]

## Utilize sua conta criada para acessar e utilizar o webstorm

## Crie seu primeiro projeto React Native

* Com typescript

```console
npx react-native init NOME_DO_SEU_PROJETO
```

* Com javascript

```console
npx react-native init NOME_DO_SEU_PROJETO --version 0.70.0
```

## Abra a pasta do projeto no VsCode e let's code!