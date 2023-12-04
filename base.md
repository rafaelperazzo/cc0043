```javascript
import * as React from 'react';
import { View, TextInput, Button, Text } from 'react-native';

export default function App() {
  return(
      <View>
          <Text>Usuário</Text>
          <TextInput />
          <Text>Senha</Text>
          <TextInput secureTextEntry={true} />
          <Button title="Entrar"/>
      </View>
  );
}
```
