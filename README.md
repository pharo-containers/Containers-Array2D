# Containers-Array2D

<a href="https://www.pharo.org">
    <img alt="Pharo" src="https://img.shields.io/static/v1?style=for-the-badge&message=Pharo&color=3297d4&logo=Harbor&logoColor=FFFFFF&label=" />
</a>

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
![https://github.com/pharo-containers/Containers-Array2D/workflows/matrix/badge.svg](https://github.com/pharo-containers/Containers-Array2D/workflows/matrix/badge.svg)
![https://github.com/pharo-containers/Containers-Array2D/workflows/currentStablePharo/badge.svg](https://github.com/pharo-containers/Containers-Array2D/workflows/currentStablePharo/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-containers/Containers-Array2D/badge.svg?branch=master)](https://coveralls.io/github/pharo-containers/Containers-Array2D?branch=master)

A better Array2D implementation 

This package is part of the Containers project: This project is to collect, clean, 
test and document alternate collection datastructures. Each package is modular so that users 
can only load the collection they need without 100 of related collections.

## Loading

```smalltalk
Metacello new
  baseline: 'ContainersArray2D';
  repository: 'github://pharo-containers/Containers-Array2D/src';
  load.
```

## If you want to depend on it

```smalltalk
  spec 
    baseline: 'ContainersArray2D' 
    with: [ spec repository: 'github://pharo-containers/Containers-Array2D/src' ].
  ```

----
The best way to predict the future is to do it!
Less talking more doing. stephane.ducasse@inria.fr
