CC=atscc
CFLAGS=
LDFLAGS=
VPATH=.

objects= hello

all: main

hello: hello.dats Makefile


main: $(objects)
	cat $(objects) > main
