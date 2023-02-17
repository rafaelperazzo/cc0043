# WEBSOTORM

## Executando o app no webstorm

* Inicie o emulador

```console
emulator -avd android_react
```

* Crie o arquivo local.properties

```console
cd PASTA_DO_SEU_PROJETO
pico android/local.properties
```

* Adicione a linha: sdk.dir=/opt/android_sdk

* No webstorm, menu RUN -> Edit Configurations, clique no sinal + e adicione uma configuração de React Native

## Iniciando o emulador dentro do webstorm

1. Abra o menu File -> Settings
2. Escolha a opção Tools -> External Tools
3. Clique no +
4. Preencha os campos Name e program com ***Emulador*** e ***/opt/android_sdk/emulator/emulator*** respectivamente

<https://www.jetbrains.com/help/webstorm/react-native.html#starting_with_existing_react_native_app_project_security>
