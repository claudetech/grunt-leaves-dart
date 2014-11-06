# Grunt Leaves dart

A Grunt plugin to to get Dart support
in [Leaves](http://oss.claudetech.com/leaves/).

This will not be useful if you are not using Leaves.

In development, this copies the Dart files
and reload the browser automatically, so you need
a browser that can run Dart (only Dartium for now).

The production mode is in progress. When done,
it will compile everything to the `dist` directory.

## Installation

```sh
$ npm install --save-dev grunt-leaves-dart
```

## Usage

You should have a `dart` directory with your `.dart`
files, and your `pubspec.yaml` at th root directoy.
Note that you need to run `pub get` manually.

```sh
$ tree
.
├── assets
│   ├── css
│   │   └── main.styl
│   ├── dart
│   │   └── main.dart
│   ├── favicon.ico
│   ├── img
│   └── js
│       └── app.coffee
├── bower.json
├── package.json
├── pubspec.yaml
└── views
    ├── index.jade
    └── layout.jade
```
