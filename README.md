# flutter_custom_template

A custom skeleton template for flutter.

## Getting Started

This project is a starting point for a Flutter application.

This project is a skeleton template for creating new flutter project using it.

## Feature


- Clean Architecture folder structure
- Most commonly used libraries
- Flutter Lint configuration and predefined rules
- BLoC (Business Logic Component) design patter
- Alert and Snackbar Utility
- Localization setup
- Setup of Flavor
- Logger


#### Features of logger
- Log on console as well as file
- Able to change log level and turn off logs
- Able to export log files in email
- Automatic log clearing mechanism
- Log entry with readable time
- Zip files all log files
- Creates a new log file for everyday


## Plugins

flutter_custom_library is currently extended with the following libraries.
Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| cupertino_icons | [https://pub.dev/packages/cupertino_icons][PlDb] |
| flutter_bloc | [https://pub.dev/packages/flutter_bloc][PlDb] |
| equatable | [https://pub.dev/packages/equatable][PlDb] |
| get_it | [https://pub.dev/packages/get_it][PlDb] |
| dio | [https://pub.dev/packages/dio][PlDb] |
| simple_connection_checker | [https://pub.dev/packages/simple_connection_checker][PlDb] |
| shared_preferences | [https://pub.dev/packages/shared_preferences][PlDb] |
| mockito | [https://pub.dev/packages/mockito][PlDb] |
| enum_to_string | [https://pub.dev/packages/enum_to_string][PlDb] |
| collection | [https://pub.dev/packages/collection][PlDb] |
| logger | [https://pub.dev/packages/logger][PlDb] |
| path_provider | [https://pub.dev/packages/path_provider][PlDb] |
| flutter_email_sender | [https://pub.dev/packages/flutter_email_sender][PlDb] |
| flutter_archive | [https://pub.dev/packages/flutter_archive][PlDb] |

## Installation
[online documentation](https://pub.dev/packages/flutter_create)
**If you want to use flutter_create on the command line, install it using pub ```global activate:```**

```flutter pub global activate flutter_create```
######              or
```pub global activate flutter_create```

<sub> If gives path related Warning! Then </sub>
```vim ~/.bashrc```
###### Add in the file
<sub>export PATH="$PATH":"$HOME/flutter/.pub-cache/bin"</sub>
<sub>Press ```:wq!``` and enter</sub>

## Creating project with the skeleton template

###### Run this command in terminal
```flutter pub global run flutter_create -a appname -u https://github.com/rspl-nilesh/flutter_custom_template.git```
######              or
```pub global run flutter_create -a appname -u https://github.com/rspl-nilesh/flutter_custom_template.git```
######              or
```flutter_create -a appname -u https://github.com/rspl-nilesh/flutter_custom_template.git```


## Flavors

flutter_custom_library comes with three build in flavors ** prod **, ** qa ** and ** dev **.

| Flavor | file name |
| ------ | ------ |
| prod | main.dart |
| qa | main_qa.dart |
| dev | main_dev.dart |

## Run app with different flavor

Run these commands in terminal

Prod:

```sh
flutter run --flavor prod -t lib/main.dart
```

QA:

```sh
flutter run --flavor qa -t lib/main_qa.dart
```

Dev:

```sh
flutter run --flavor dev -t lib/main_dev.dart
```


#### Setup flavor configuration in Android studio or VSCode

Follow this link to setup the configuration for different flavors. ** Careful with the flavor name and the flavor entry point **

[https://medium.com/@vo9312/flutter-series-part-1-flutter-flavors-setup-bb6aba1586ac]
