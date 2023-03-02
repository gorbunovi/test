# test

flutter pub run build_runner build --delete-conflicting-outputs

flutter clean && flutter pub get

flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi --no-sound-null-safety  


keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
