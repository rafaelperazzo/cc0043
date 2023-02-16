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

## Usando a função map para renderizar um array

```javascript

{props.dados.map(item => {
    return <Text key={item.key}>{item}</Text>;
})}

```