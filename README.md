# dart-flutter-webview

## Screenshot

![Screenshot](./Screenshot.png)

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
