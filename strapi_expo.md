# Exemplo de autenticação e get com Axios e Strapi

```javascript
import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Button, ScrollView, TextInput } from 'react-native-web';
import axios from 'axios';

axios.defaults.baseURL = 'http://10.0.84.179:1337/api';

export default function App() {
  
  const [dados,setDados] = React.useState([]);
  const [usuario,setUsuario] = React.useState('');
  const [senha,setSenha] = React.useState('');
  const [jwt,setJwt] = React.useState('');
  return (
    <View style={styles.container}>
      <Button title="Aperte" onPress={async () => 
        {
            const {data} = await axios.get('/informes', {headers: {Authorization: `Bearer ${jwt}`}});
            //console.log(data.data[1].attributes.autor);
            setDados(data.data);
        }
      } 
      />
      <TextInput placeholder="Digite aqui o usuário" 
        onChangeText={setUsuario}
      />
      <TextInput placeholder="Digite aqui a senha" 
        onChangeText={setSenha}
        secureTextEntry={true}
      />
      <Button title="Login" onPress={async () => 
          {
              try {
                const response = await axios.post('/auth/local',{identifier:usuario,password:senha});
                //console.log(response.data.jwt);
                setJwt(response.data.jwt);
              }
              catch (error) {
                console.log(error);
              }
              
          }
        }
      />

      <ScrollView>
        {dados.map((item) => (
          <Text key={item.id}>{item.attributes.autor}</Text>
        ))}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
```
