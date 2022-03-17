# react-native-get-safearea

[![npm version](https://badge.fury.io/js/react-native-get-safearea.svg)](https://badge.fury.io/js/react-native-get-safearea)

Get metadata of safe area from the native code.

## Status

- ios
  - Fully supported
- android
  - Currently(22/03/18), it will just return top height of safe area with the value of `StatusBar.currentHeight`

## Installation

```sh
npm install react-native-get-safearea
```

## Usage

```js
import { getSafeArea } from 'react-native-get-safearea';

// ...

const result = await getSafeArea();
console.log(result); // { left: 0, top: 48, right: 0, bottom: 34 }
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
