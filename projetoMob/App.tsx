import React from 'react';
import {Button, StatusBar, Text, View} from 'react-native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import {NavigationContainer} from '@react-navigation/native';
import Auth from './autenticacao';

function Tela1(): JSX.Element {
  return <Auth />;
}

function Home({navigation}: any): JSX.Element {
  return (
    <View>
      <StatusBar barStyle="dark-content" backgroundColor="#ecf0f1" />
      <Text>Tela principal</Text>
      <Button
        title="Autenticação"
        onPress={() => navigation.navigate('Tela1')}
      />
    </View>
  );
}

const Stack = createNativeStackNavigator();

function App(): JSX.Element {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen
          name="Home"
          options={{title: 'Principal'}}
          component={Home}
        />
        <Stack.Screen name="Tela1" component={Tela1} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
