# Package.json script (RN Bare)

```json
{
  "splash:pad": "python3 scripts/pad-android-splash.py",
  "android": "expo run:android && cd android && ./gradlew --stop && cd ..",
  "android:clean": "cd android && ./gradlew --stop && cd .. && find . -type d -name \".cxx\" -prune -exec rm -rf {} + && find node_modules -type d -path \"*/android/build\" -prune -exec rm -rf {} + && rm -rf android/app/build android/build android/.gradle node_modules/.cache",
  "android:release": "expo run:android --variant release && cd android && ./gradlew --stop && cd ..",
  "android:aab": "npm run android:clean && cd android && ./gradlew app:bundleRelease && ./gradlew --stop && cd ..",
  "android:apk": "npm run android:clean && cd android && ./gradlew app:assembleRelease && ./gradlew --stop && cd ..",
  "android:key": "cd android && ./gradlew signinReport && cd ..",
  "ios": "expo run:ios",
  "ios:sync": "npx expo prebuild --platform ios --clean",
  "ios:release": "expo run:ios --configuration Release"
}
```

# Package.json script (EXPO)

```json
{
  "check": "npx expo-doctor",
  "check-lib": "npx expo install --check",
  "prebuild": "expo prebuild",
  "prebuild:clean": "expo prebuild --clean",
  "lint": "expo lint",
  "preview": "eas build -p all --profile preview",
  "update": "eas update --branch preview",
  "start": "expo start -c",
  "splash:pad": "python3 scripts/pad-android-splash.py",
  "android": "expo run:android && cd android && ./gradlew --stop && cd ..",
  "android:clean": "cd android && ./gradlew --stop && cd .. && find . -type d -name \".cxx\" -prune -exec rm -rf {} + && find node_modules -type d -path \"*/android/build\" -prune -exec rm -rf {} + && rm -rf android/app/build android/build android/.gradle node_modules/.cache",
  "android:release": "expo run:android --variant release && cd android && ./gradlew --stop && cd ..",
  "android:aab": "npm run android:clean && cd android && ./gradlew app:bundleRelease && ./gradlew --stop && cd ..",
  "android:apk": "npm run android:clean && cd android && ./gradlew app:assembleRelease && ./gradlew --stop && cd ..",
  "android:key": "cd android && ./gradlew signinReport && cd ..",
  "ios": "expo run:ios",
  "ios:sync": "npx expo prebuild --platform ios --clean",
  "ios:release": "expo run:ios --configuration Release"
}
```

# Clean Gradle Global Cache
```rm -rf ~/.gradle/caches```

# Clean Xcode Cache
- ```rm -rf ~/Library/Developer/CoreSimulator/Devices/*```
- ```rm -rf ~/Library/Developer/Xcode/DerivedData/*```

# react native asset (implement fonts)
```npx react-native-asset```

# Init RN spesific version
```npx @react-native-community/cli@latest init MyApp --version 0.79.1```

# Init EXPO
```npx create-expo-app MyApp```

# ANDROID GRADLE SETUP
```
release {
    if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {
        storeFile file(MYAPP_RELEASE_STORE_FILE)
        storePassword MYAPP_RELEASE_STORE_PASSWORD
        keyAlias MYAPP_RELEASE_KEY_ALIAS
        keyPassword MYAPP_RELEASE_KEY_PASSWORD
    }
}

signingConfig signingConfigs.release

MYAPP_RELEASE_STORE_FILE=my-release-key.jks
MYAPP_RELEASE_KEY_ALIAS=my-release-key-alias
MYAPP_RELEASE_STORE_PASSWORD=
MYAPP_RELEASE_KEY_PASSWORD=

org.gradle.jvmargs=-Xmx4096m -XX:MaxMetaspaceSize=1024m

splits {
    abi {
        enable true
        reset()
        include 'armeabi-v7a', 'arm64-v8a'
        universalApk true
    }
}
```

# SDK PLATFORM VERSION ANDROID
```./gradlew :app:properties | grep -i "sdk"```

# CLEAN PROJECT UNUSED
```
rm -rf node_modules android/app/build ios/build ios/Pods && watchman watch-del-all

rm -rf \
  "$HOME/.gradle/caches" \
  "$HOME/.android/build-cache" \
  "$HOME/.android/cache"
emulator -list-avds
avdmanager delete avd -n "NAMA_AVD"

rm -rf \
  "$HOME/Library/Developer/Xcode/DerivedData" \
  "$HOME/Library/Developer/Xcode/Archives" \
  "$HOME/Library/Developer/Xcode/iOS DeviceSupport" \
  "$HOME/Library/Caches/com.apple.dt.Xcode"
xcrun simctl delete unavailable

find "$HOME/Project" -type d \( -name node_modules -o -name .next \) -prune -exec rm -rf {} +
npm cache clean --force
rm -rf ~/.npm/_npx
pod cache clean --all
yarn cache clean
brew cleanup
brew autoremove
```

# ANDROID FAILED BUILD AUTOLINKING (EXPO)
```
cd android && ./gradlew --stop && cd .. && rm -rf android/app/build android/build android/.gradle android/app/.cxx node_modules/.cache && find android -type d -name \".cxx\" -exec rm -rf {} + && cd android && ./gradlew clean && cd ..
```
