all : bin/client_static bin/client_dynamic

bin/client_static: obj/main.o lib/libmyutils.a
	gcc obj/main.o lib/libmyutils.a  -o bin/client_static
bin/client_dynamic:obj/main.o lib/libmyutils.so
	gcc obj/main.o -Llib -lmyutils -o bin/client_dynamic
obj/string_utils.o: src/string_utils.c include/string_utils.h
	gcc -c -Iinclude src/string_utils.c -o obj/string_utils.o

obj/file_utils.o: src/file_utils.c include/file_utils.h
	gcc -c -Iinclude src/file_utils.c -o obj/file_utils.o

obj/main.o: src/main.c include/string_utils.h include/file_utils.h
	gcc -c -Iinclude src/main.c  -o  obj/main.o

lib/libmyutils.a: obj/string_utils.o obj/file_utils.o
	ar rcs lib/libmyutils.a obj/string_utils.o obj/file_utils.o


lib/libmyutils.so: src/string_utils.c src/file_utils.c
	gcc -shared -fPIC src/string_utils.c src/file_utils.c -Iinclude -o lib/libmyutils.so

clean:
	rm -f obj/*.o
	rm -f lib/*.a
	rm -f lib/*.so
	rm -f bin/*

.PHONY: all clean

