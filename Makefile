CC=atscc
CFLAGS=
LDFLAGS=
VPATH=.

objects= hello

all: main

hello: hello.dats Makefile
	$(CC) -o hello hello.dats

main: $(objects)
	cat $(objects) > main
