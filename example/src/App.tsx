import * as React from 'react';
import { Button, StyleSheet, View } from 'react-native';
import MapView from 'react-native-get-safearea';

export default function App() {
  return <MapView style={{ flex: 1 }} />;
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

// <View style={styles.container}>
//   <Button
//     title="Test getSafeArea"
//     onPress={() => getSafeArea().then((notch) => console.log(notch))}
//   />
// </View>
