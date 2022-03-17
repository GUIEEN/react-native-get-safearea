import { NativeModules, Platform, StatusBar } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-get-safearea' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const GetSafearea = NativeModules.GetSafearea
  ? NativeModules.GetSafearea
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export type ISafeArea = {
  top: number;
  bottom: number;
  left: number;
  right: number;
};

export async function getSafeArea(): Promise<ISafeArea> {
  if (Platform.OS === 'android') {
    // FIXME: - Kotlin
    return new Promise((resolve, _) => {
      const dict: ISafeArea = {
        top: StatusBar.currentHeight ?? 0,
        bottom: 0,
        left: 0,
        right: 0,
      };
      resolve(dict);
    });
  }

  return GetSafearea.getSafeArea();
}
