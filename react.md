# Usando a função map para renderizar um array

```javascript

{props.dados.map(item => {
    return <Text key={item.key}>{item}</Text>;
})}

```