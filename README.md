# dart-flutter-webview

## Screenshot

![Screenshot](./Screenshot.png)
![Screenshot2](./Screenshot2.png)
![Screenshot3](./Screenshot3.png)

## Installing

- [webview_flutter](https://pub.dev/packages/webview_flutter)  
  A Flutter plugin that provides a WebView widget on Android and iOS.

  ```shell
  fvm flutter pub add webview_flutter
  ```

  Import it

  ```dart
  import 'package:webview_flutter/webview_flutter.dart';
  ```

## Configure

Edit `android/app/src/main/AndroidMainfest.xml`

```xml
<manifest ... >
    <uses-permission android:name="android.permission.INTERNET"/>
    <application>
        ...
    </application>
</manifest>
```

Edit `android/app/build.gradle`

```txt
android {
    defaultConfig {
        minSdkVersion 19
    }
}
```

Edit `android/app/src/main/AndroidMainfest.xml` to allow http.

```xml
<manifest ... >
    <application ...
        android:usesCleartextTraffic="true">
        ...
    </application>
</manifest>
```

Edit `ios/Runner/Info.plist` to allow http.

```xml
<dict>
    ...
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsLocalNetworking</key>
        <true/>
        <key>NSAllowsArbitraryLoadsInWebContent</key>
        <true/>
    </dict>
</dict>
```

## Deployment

Edit `android/app/src/main/AndroidMainfest.xml`

```xml
<manifest ... >
    <application ...
        android:label="APPLICATION_NAME">
        ...
    </application>
</manifest>
```

Edit `ios/Runner/Info.plist` to allow http.

```xml
<dict>
    ...
    <key>CFBundleDisplayName</key>
    <string>APPLICATION_NAME</string>
    ...
</dict>
```

Web app: `build/web`

```shell
fvm flutter build web --release
```

Windows app: `build/windows/runner/Release`

```shell
fvm flutter build windows --release
```

Android app: `build/app/outputs/flutter-apk/app-release.apk`

```shell
fvm flutter build apk --release --target-platform=android-arm64
```

Ios app: `build/ios/iphoneos`

```shell
fvm flutter build ios --release
```

## Commands

```shell
fvm flutter create --org com.example application
```

```shell
cd application
```

```shell
fvm flutter pub get
```

```shell
fvm flutter run
fvm flutter run -d chrome
fvm flutter run -d windows
```

```shell
fvm flutter pub outdated
fvm flutter pub upgrade
```

```shell
fvm flutter clean
```
