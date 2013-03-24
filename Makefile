
hello: hello.dats Makefile
	atscc -o hello hello.dats

run: hello
	./hello
