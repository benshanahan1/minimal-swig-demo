all: build
remake: clean build

build:
	python setup.py build_ext --inplace

clean:
	rm -rf build *.pyc *.so test_wrap.c test.py