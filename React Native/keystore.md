# Generate release keystone
- ```keytool -genkeypair -v -storetype PKCS12 -keystore my-upload-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000```
  > for windows
- ```keytool -genkey -v -keystore my-release-key.keystore -alias my-release-key-alias -keyalg RSA -sigalg SHA1withRSA -keysize 2048 -validity 10000```
  > for Mac