#Plik Makefile
#Autor: Aleksandra Olejarz grupa 2.5/9

CC=g++
.PHONY: clean
.PHONY: move
.SUFFIXES: .cpp .o .a .so

vpath %.h include
vpath %.a lib
vpath %.so lib
vpath %.cpp src
vpath % bin 

.cpp.o: 
	$(CC) -c $<
.o:
	$(CC) -o $@ $^
	
#Reguly przyrostkow nie dziala w tym przypadku, dlatego podaje tylko przyklad tego jak powinny wygladac

pol%.o: pol%.cpp
	$(CC) -c $<
pol%.a: pol%.o
	ar rs $@ -shared -o $<
ob%.so: ob%.o
	$(CC) $@ -shared -o $<	

#Reguly wzorca nie dzialaja w tym przypadku, dlatego podaje tylko przyklad tego, jak powinny wygladac 

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
	
move:
	mv *.h include
	mv pola.a lib
	mv objetosci.so lib
	mv *.cpp src
	mv Code2 bin
	
#Zakladam tutaj, ze te foldery zostaly wczesniej utworzone

clean:
	rm -rf *.o *.a *.so Code2
