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

You need to set the base directory for `tmp` to `tmp/web`:

```sh
$ leaves config set dir.tmp tmp/web
```

The directory layout should look like this.

```sh
$ tree
.
├── assets
│   ├── css
│   │   └── main.styl
│   ├── favicon.ico
│   ├── img
│   └── js
│       └── app.coffee
├── bower.json
├── dart
│   ├── lib
│   │   ├── alibfile.dart
│   │   └── mypackage
│   ├── pubspec.lock
│   └── web
│       └── main.dart
├── package.json
└── views
    ├── index.jade
    └── layout.jade
```
