# Generate release keystone
- ```keytool -genkeypair -v -storetype PKCS12 -keystore my-upload-key.jks -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000```
  > for windows
- ```keytool -genkey -v -keystore my-release-key.jks -alias my-release-key-alias -keyalg RSA -sigalg SHA1withRSA -keysize 2048 -validity 10000```
  > for Mac

# check information keystore file
- ```keytool -list -v -keystore android/app/my-release-key.keystore -alias my-release-key-alias```

# create .pem certificate file
- ```keytool -export -rfc -keystore upload-keystore.jks -alias upload -file upload_certificate.pem```
