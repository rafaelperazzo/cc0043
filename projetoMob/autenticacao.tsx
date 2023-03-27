import React, {useState} from 'react';
import {Alert, Button, Text, TextInput, View} from 'react-native';

function Auth(): JSX.Element {
  const [senha, setSenha] = useState('');
  return (
    <View>
      <Text>Usuário</Text>
      <TextInput placeholder={'Seu nome de usuário'} />
      <Text>Senha</Text>
      <TextInput
        placeholder={'Sua senha'}
        secureTextEntry={true}
        onChangeText={novaSenha => setSenha(novaSenha)}
        defaultValue={senha}
      />
      <Button
        title={'Confirmar'}
        onPress={() => {
          Alert.alert('Apertado!');
        }}
      />
    </View>
  );
}

export default Auth;
