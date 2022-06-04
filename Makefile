#Plik Makefile
#Autor: Aleksandra Olejarz grupa 2.5/9 

CC=g++
.PHONY: clean
.SUFFIXES: .cpp .o .a .so
.cpp.o: 
	$(CC) -c $<
.o:
	$(CC) -o $@ $^
	
#Regula przyrostkow nie dziala w tym przypadku, dlatego podaje tylko przyklad tego, jak powinna wygladac

Code2: Code2.o objetosci.so pola.a
	$(CC) -o Code2 Code2.o objetosci.so pola.a 
	export LD_LIBRARY_PATH=:/home/student/Desktop/Code2
	
Code2.o: Code2.cpp objetosci.h pola.h
	$(CC) -c Code2.cpp
	
objetoscfunkcja.o: objetoscfunkcja.cpp
	$(CC) -c -fPIC objetoscfunkcja.cpp
	
polefunkcja.o: polefunkcja.cpp
	$(CC) -c $<
	
objetosci.so: objetoscfunkcja.o
	$(CC) objetoscfunkcja.o -shared -o objetosci.so 

pola.a: polefunkcja.o	
	ar rs $@ $<
clean:
	rm -rf *.o *.a *.so Code2
