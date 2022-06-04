#Plik Makefile
#Autor: Aleksandra Olejarz grupa 2.5/9 

Code2: Code2.o objetosci.so pola.a
	g++ -o Code2 Code2.o objetosci.so pola.a 
	export LD_LIBRARY_PATH=:/home/student/Desktop/Code2
	
Code2.o: Code2.cpp objetosci.h pola.h
	g++ -c Code2.cpp
	
objetoscfunkcja.o: objetoscfunkcja.cpp
	g++ -c -fPIC objetoscfunkcja.cpp
	
polefunkcja.o: polefunkcja.cpp
	g++ -c polefunkcja.cpp

objetosci.so: objetoscfunkcja.o
	g++ objetoscfunkcja.o -shared -o objetosci.so 
	
pola.a: polefunkcja.o
	ar rs pola.a polefunkcja.o

clean:
	rm -rf *.o *.a *.so Code2
