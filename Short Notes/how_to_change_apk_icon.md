# How to change the Apk icon in flutter?

In flutter we can easily change the launching icon for all the platforms. We can do the process menually or use some packages to do it automatically. i will prefur to use the pub pacage to change the launching icon.

## Change the icon using package

<b>Package Name</b>: Flutter Launcher Icons
<b>Pub points</b>: 130
<b>Popularity</b>: 100%

##### Step 1:
Add your Flutter Launcher Icons configuration to your <b>pubspec.yaml</b>.

````
dev_dependencies:
  flutter_launcher_icons: any # Use the latest version form pub.dev

flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icon/icon.png"
  min_sdk_android: 21 # android min sdk min:16, default 21
  web:
    generate: true
    image_path: "path/to/image.png"
    background_color: "#hexcode"
    theme_color: "#hexcode"
  windows:
    generate: true
    image_path: "path/to/image.png"
    icon_size: 48 # min:48, max:256, default: 48
  macos:
    generate: true
    image_path: "path/to/image.png"
````

Add only necessary platform in <b>flutter_launcher_icon</b> section.

##### Step 2:
Now run the folloing command in tarminal to run the new package. Run the instractions one by one.

````
flutter pub get
flutter pub run flutter_launcher_icons
````
