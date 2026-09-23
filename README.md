#OS PA01 - Custom C Utility  Library
##Description

This projects implements a custom C library containing string and file utility functions

##Directory Structure


include - Header files
src -  Source files
obj -  Object files
lib - Static and dynamic libraries
bin - Executable files
man - Manual pages

##Build 
Compile project:

make 

Clean project:
make clean

##Execute
Static executable:
./bin/client_static


Dynamic executable:
export LD_LIBRARY_PATH=$PWD/lib:$LD_LIBRARY_PATH
./bin/client_dynamic

##Functions
String utilities:
  -my_strlen()
File utilities:
  -count_words:
##Libraries
  Static library:
     lib/libmyutils.a
  Shared library:
     lib/libmyutils.so


