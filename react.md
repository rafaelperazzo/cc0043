# React Native

## Criando um novo projeto

* Com typescript

```console
npx react-native init NOME_DO_SEU_PROJETO
```

* Com javascript

```console
npx react-native init NOME_DO_SEU_PROJETO --version 0.70.0
```

## Criando um novo app

```console
npx react-native@latest init NOME_DO_PROJETO
```

## Iniciando o Metro

```console
npx react-native start
```

## Iniciando o app

```console
npx react-native run-android
```

## Usando a função map para renderizar um array

```javascript

{props.dados.map(item => {
    return <Text key={item.key}>{item}</Text>;
})}

```