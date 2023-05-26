# LAUNCHER_ICONS

## Installation

[Flutter Launcher Icons]([[flutter_launcher_icons]()](https://pub.dev/packages/flutter_launcher_icons))

A package which simplifies the task of updating your Flutter app's launcher icon.

- File extension: png
- Minimum image size: 1024px x 1024px
- Maximum file size: 1024 KB

```shell
fvm flutter pub add --dev flutter_launcher_icons
```

Run the following command to create a new config automatically:

```shell
fvm flutter pub run flutter_launcher_icons:generate
```

Run the package

```shell
fvm flutter pub run flutter_launcher_icons:main
```

## Configure

Edit: `pubspec.yaml`

```yaml
# The following section is specific to Flutter packages.
flutter:

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/icon/
```

Edit: `flutter_launcher_icons.yaml`

```yaml
flutter_launcher_icons:
  image_path: "assets/icon/launcher_icon.png"
  ...
```
