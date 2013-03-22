CC=atscc

objects= hello

all: foo

hello: hello.dats Makefile

foo: $(objects)
	cat $(objects) > foo
