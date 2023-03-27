import React from 'react';
import {Button, Text, View} from 'react-native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import {NavigationContainer} from '@react-navigation/native';
import Auth from './autenticacao';

function Tela1({navigation, route}): JSX.Element {
  return <Auth />;
}

function Home({navigation}): JSX.Element {
  return (
    <View>
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
