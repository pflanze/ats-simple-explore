CC=atscc

objects= hello.o

all: hello

hello.o: hello.dats Makefile

hello: $(objects)
