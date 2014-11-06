# Grunt Leaves dart

A Grunt plugin to to get Dart support
in [Leaves](http://oss.claudetech.com/leaves/).

This will not be useful if you are not using Leaves.

## Installation

```sh
$ npm install --save-dev grunt-leaves-dart
```

## Usage

Create a `dart` directory under `assets`, and add
your normal Dart project structure there.

The project should look something like this.

```sh
$ tree
.
├── assets
│   ├── css
│   │   └── main.styl
│   ├── dart
│   │   ├── pubspec.yaml
│   │   └── web
│   │       └── main.dart
│   ├── favicon.ico
│   ├── img
│   └── js
│       └── app.coffee
├── bower.json
├── package.json
└── views
    ├── index.jade
    └── layout.jade
```
