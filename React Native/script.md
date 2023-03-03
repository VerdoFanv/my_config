# Package.json script

```json
{
  "clean": "rm -rf node_modules && yarn install",
  "clean:win": "rd -r node_modules; yarn install",
  "android": "react-native run-android",
  "android:clean": "cd android && ./gradlew clean && cd ..",
  "android:apk": "cd android  && ./gradlew clean && ./gradlew app:assembleRelease && cd ..",
  "android:aab": "cd android && ./gradlew clean && ./gradlew bundleRelease && cd ..",
  "ios": "react-native run-ios",
  "ios:i8": "react-native run-ios --simulator='iPhone 8'",
  "ios:i14": "react-native run-ios --simulator='iPhone 14 Pro'",
  "ios:clean": "cd ios && rm -rf Pods Podfile.lock build && cd ..",
  "pod:i": "cd ios && pod install && cd ..",
}
```