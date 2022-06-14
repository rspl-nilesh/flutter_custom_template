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