from distutils.core import setup, Extension

setup(
    name   = "test",
    author = "Your Name",
    ext_modules = [ Extension(name="_test", sources=["test.i", "test.c"]) ]
)