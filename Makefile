SHELL=/bin/bash
.SHELLFLAGS := -O extglob -c

CC = gcc

CFLAGS = -ggdb -Wall -lKernel32

ROOT = C:/Users/Brynn/Dev/hexane

MODULES = $(ROOT)/modules
OBJECTS = $(ROOT)/objects
TARGET = $(ROOT)/target

SRC := $(shell find $(MODULES) -name "*" -type f) 
OBJ := $(shell find $(OBJECTS) -name "*" -type f) 

build: 
	$(shell rm -drf $(OBJECTS))
	$(shell mkdir $(OBJECTS))

	$(foreach path,$(SRC),$(shell mkdir -p $(shell dirname $(patsubst $(MODULES)/%,$(OBJECTS)/%,$(path)))))
	$(foreach path,$(SRC),$(shell $(CC) $(CFLAGS) -I$(MODULES) -x c++ -c $(path) -o $(patsubst $(MODULES)/%,$(OBJECTS)/%,$(path)) -nostdlib))
	
	$(shell mkdir -p $(TARGET))
	$(shell $(CC) $(CFLAGS) -o $(TARGET)/app $(OBJ))



