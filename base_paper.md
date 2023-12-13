```console
import * as React from 'react';
import {View,StyleSheet} from 'react-native';
import {Text,Button,TextInput} from 'react-native-paper';

export default function App() {
  return (
    <View>
      
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'center',
    backgroundColor: 'gray',
  },
  cabecalho: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'blue',
  },
  conteudo: {
    flex: 5,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'flex-start',
    flexWrap: 'wrap',
    alignContent: 'flex-start',
    backgroundColor: 'green',
  },
  rodape: {
    flex: 1,
    backgroundColor: 'yellow',
    flexDirection: 'row',
    justifyContent: 'flex-end',
    flexWrap: 'wrap',
    alignContent: 'space-around',

  },
  texto: {
    fontSize: 18,
    fontWeight: 'bold',
    margin: 10,
    backgroundColor: 'white',
    padding: 20,
  },
  texto_cabecalho: {
    fontSize: 18,
    fontWeight: 'bold',
    margin: 10,
  },
  texto_rodape: {
    fontSize: 14,
    fontWeight: 'bold',
    margin: 10,
  },
});
```
