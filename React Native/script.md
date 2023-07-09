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
  "ios:add:permission": "react-native setup-ios-permissions",
  "ios:i8": "react-native run-ios --simulator='iPhone 8'",
  "ios:i14": "react-native run-ios --simulator='iPhone 14 Pro'",
  "ios:i14:release": "react-native run-ios --configuration Release --simulator='iPhone 14 Pro'",
  "ios:clean": "cd ios && rm -rf Pods Podfile.lock build && cd ..",
  "pod:i": "cd ios && pod install && cd ..",
  "pod:i:newarch": "react-native setup-ios-permissions && cd ios && RCT_NEW_ARCH_ENABLED=1 pod install && cd ..",
  "codepush:stag:android": "appcenter codepush release-react -a email/app-name -d Staging -t 1.0.0 -m",
  "codepush:stag:ios": "appcenter codepush release-react -a email/app-name -d Staging -t 1.0.0 -m"
}
```