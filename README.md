# Containers-Array2D

[![Build Status](https://travis-ci.com/Ducasse/Containers-Array2D.svg?branch=master)](https://travis-ci.com/Ducasse/Containers-Array2D)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-Array2D/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-Grid?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/dataframe)  -->


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
