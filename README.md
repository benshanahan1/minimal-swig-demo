# Minimum working example of SWIG + C + Python

SWIG is used to create a wrapper around an existing library, for example, written in C.

In this repository is a minimum working example of using SWIG to compile a Python wrapper for several C functions.


## Install
```shell
sudo apt -y install swig python2.7-dev
```

## Build
```shell
make
```

## Using the Python module
To include / access the built Python extension in your own code, you must copy both *test.py* and *_test.so* into your project directory. It can now be imported using the Python `import` directive like so:

```python
import test
dir(test)  # show functions and classes

# let's use the methods
test.ReturnOne()
test.SayHello("Ben")

# let's use the extended struct (which is now a class)
x = test.MyStruct()
dir(x)  # show methods
x.one = 4
x.two = 7
x.AddEm()
```


## Additional notes
To force rebuild the project, run:
```shell
make remake
```

To clean the project, run:
```shell
make clean
```


## About SWIG

SWIG stands for *Simplified Wrapper and Interface Generator*. It generates C 
and C++ software wrappers in a variety of higher-level, often interpreted, 
languages such as Python. SWIG is basically another C preprocessor, in front of
the standard one. More information can be found [here](http://www.swig.org/).

To generate a new wrapper, SWIG requires an interface (\*.i) file. This file
defines which functions and data structures are to be exposed in the generated
wrapper. SWIG also lets you write additional wrapper functions that can make
an interface more intuitive and usable. The SWIG interface file is written in C
with SWIG-specific tags (starting with percent (%) signs mixed in).