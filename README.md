# Containers-Array2D

[![Build Status](https://travis-ci.com/pharo-containers/Containers-Array2D.svg?branch=master)](https://travis-ci.com/pharo-container/Containers-Array2D)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()

A better Array2D implementation 

This package is part of the Containers project: This project is to collect, clean, 
test and document alternate collection datastructures. Each package is modular so that users 
can only load the collection they need without 100 of related collections.

## Loading

```
Metacello new
  baseline: 'ContainersArray2D';
  repository: 'github://pharo-containers/Containers-Array2D/src';
  load.
```

## If you want to depend on it

```
  spec 
    baseline: ''ContainersArray2D' 
    with: [ spec repository: 'github://pharo-containers/Containers-Array2D/src' ].
  ```

----
The best way to predict the future is to do it!
Less talking more doing. stephane.ducasse@inria.fr
