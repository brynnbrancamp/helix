SHELL=/bin/bash
.SHELLFLAGS := -O extglob -c

CC = g++

CFLAGS = -ggdb -Wall -lKernel32 -Wl,-subsystem,console

ROOT = C:/Users/Brynn/Dev/hexane

INCLUDE = $(ROOT)/include
SOURCE = $(ROOT)/src
OBJECTS = $(ROOT)/objects
TARGET = $(ROOT)/target

SRC := $(shell find $(SOURCE) -name "*" -type f) 
OBJ := $(shell find $(OBJECTS) -name "*" -type f) 

build: 
	$(shell rm -drf $(OBJECTS))
	$(shell mkdir $(OBJECTS))

	$(foreach path,$(SRC),$(shell mkdir -p $(shell dirname $(patsubst $(SOURCE)/%,$(OBJECTS)/%,$(path)))))
	$(foreach path,$(SRC),$(shell $(CC) $(CFLAGS) -I$(INCLUDE) -x c++ -c $(path) -o $(patsubst $(SOURCE)/%,$(OBJECTS)/%,$(path))))
	
	$(shell mkdir -p $(TARGET))
	$(shell $(CC) $(CFLAGS) -o $(TARGET)/app $(OBJ))



