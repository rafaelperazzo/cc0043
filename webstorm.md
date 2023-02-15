# Executando o app no webstorm

```console
1) Inicie o emulador
    $ emulator -avd android_react
2) Crie o arquivo
    $ cd PASTA_DO_SEU_PROJETO
    $ pico android/local.properties
3) Adicione a linha:
    sdk.dir=/opt/android_sdk
4) No webstorm, menu RUN -> Edit Configurations, clique no sinal + e adicione uma configuração de React Native
```

[https://www.jetbrains.com/help/webstorm/react-native.html#starting_with_existing_react_native_app_project_security]