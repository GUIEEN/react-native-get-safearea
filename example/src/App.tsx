import * as React from 'react';
import { Button, StyleSheet, View } from 'react-native';
import { getSafeArea } from 'react-native-get-safearea';

export default function App() {
  return (
    <View style={styles.container}>
      <Button
        title="Test getSafeArea"
        onPress={() => getSafeArea().then((notch) => console.log(notch))}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
