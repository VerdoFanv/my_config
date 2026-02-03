# Package.json script (RN Bare)

```json
{
  "android": "react-native run-android && cd android && ./gradlew --stop && cd ..",
  "reset": "watchman watch-del-all && cd android && rm -rf .gradle build && ./gradlew clean && ./gradlew --stop && cd ..",
  "android:report": "cd android && ./gradlew signinReport && ./gradlew --stop && cd ..",
  "android:release": "react-native run-android --mode=release",
  "android:apk": "cd android && ./gradlew clean && ./gradlew app:assembleRelease && ./gradlew --stop && cd ..",
  "android:aab": "cd android && ./gradlew clean && ./gradlew bundleRelease && cd ..",
  "android:clean": "cd android && ./gradlew clean && cd ..",
  "android:aab:i": "cd android/app/build/outputs/bundle/release && rm -rf app-release.apks && bundletool build-apks --bundle=app-release.aab --output=app-release.apks && bundletool install-apks --apks=app-release.apks",
  "android:clean:fix": "rm -rf android/app/build android/.gradle android/app/.cxx && yarn react-native codegen --platform android --outputPath android/app/build/generated/source/codegen && yarn android:clean",
  "android:log": "npx react-native log-android",
  "ios": "react-native run-ios",
  "ios:sync": "cd ios && rm -rf Pods Podfile.lock build && pod install && cd ..",
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
  "android": "expo run:android && cd android && ./gradlew --stop && cd ..",
  "android:sync": "npx expo prebuild --platform android --clean",
  "android:release": "expo run:android --variant release && cd android && ./gradlew --stop && cd ..",
  "android:aab": "cd android && ./gradlew clean && ./gradlew app:bundleRelease && ./gradlew --stop && cd ..",
  "android:apk": "cd android && ./gradlew clean && ./gradlew app:assembleRelease && ./gradlew --stop && cd ..",
  "ios": "expo run:ios",
  "ios:sync": "npx expo prebuild --platform ios --clean && cd ios && pod install && cd ..",
  "ios:release": "expo run:ios --configuration Release",
  "ios:buildRelease": "cd ios && echo '🔨 Building iOS Release for Simulator...' && xcodebuild -workspace Jangkau.xcworkspace -scheme Jangkau -configuration Release -sdk iphonesimulator -derivedDataPath ./build clean build 2>&1 | grep -E '(▸|✔|⚠️|❌|Building|Compiling|Linking|Creating|BUILD SUCCEEDED|BUILD FAILED)' && echo '\n✅ Build completed! Installing to simulator...\n' && xcrun simctl install booted ./build/Build/Products/Release-iphonesimulator/Jangkau.app && echo '\n✅ Installed! Launching app...\n' && xcrun simctl launch booted id.jangkau.jangkau && echo '\n🚀 App launched on simulator!' && cd .."
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

org.gradle.jvmargs=-Xmx3g -XX:MaxMetaspaceSize=512m -XX:+UseG1GC -Dfile.encoding=UTF-8

org.gradle.daemon=true
org.gradle.parallel=true
org.gradle.caching=true

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
```rm -rf node_modules android/app/build ios/build ios/Pods```

# ANDROID FAILED BUILD AUTOLINKING (EXPO)
```
rm -rf android/app/build android/build android/app/.cxx node_modules/.cache && cd android && ./gradlew clean && cd ..
```
