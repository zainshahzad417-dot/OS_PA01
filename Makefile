all : program_static program_shared

program_static:  main.o lib/libmyutils.a
	gcc  main.o lib/libmyutils.a  -o program_static
program_shared: main.o lib/libmyutils.so
	gcc main.o -Llib -lmyutils -o program_shared
build.string_utils.o: src/string_utils.c include/string_utils.h
	gcc -c Iinclude src/string_utils.c -o build/string_utils.o

build/file_utils.o: src/file_utils.c include/file_utils.h
	gcc -c Iinclude src/file_utils.c -o build/file_utils.o

main.o: main.c include/string_utils.h include/file_utils.h
	gcc -c -Iinclude main.c  -o  main.o

lib/libmyutils.a: build/string_utils.o build/file_utils.o
	ar rcs lib/libmyutils.a build/string_utils.o build/file_utils.o


lib/libmyutils.so: src/string_utils.c src/file_utils.c
	gcc -shared -fPIC src/string_utils.c src/file_utils.c -Iinclude -o lib/libmyutils.so

clean:
	rm -f *.o
	rm -f build/.*o
	rm -f lib/*.a
	rm -f lib/*.so
	rm -f program_static
	rm -f program_shared

.PHONY: all clean

