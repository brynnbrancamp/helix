SHELL=/bin/bash
.SHELLFLAGS := -O extglob -c

CC = g++

CFLAGS = -ggdb -Wall -lKernel32 -Wl,-subsystem,console

PLATFORM = windows

ROOT = C:/Users/Brynn/Dev/hexane

OBJECTS = $(ROOT)/objects
MOD = $(ROOT)/modules
PLAT = $(ROOT)/platform/$(PLATFORM)

MODULE_INCLUDE = $(MOD)/include
MODULE_SOURCE = $(MOD)/src
MODULE_OBJECTS = $(OBJECTS)/modules

PLATFORM_INCLUDE = $(PLAT)/include
PLATFORM_SOURCE = $(PLAT)/src
PLATFORM_OBJECTS = $(OBJECTS)/platform/$(PLATFORM)

TARGET = $(ROOT)/target

MODULE_SRC := $(shell find $(MODULE_SOURCE) -name "*" -type f) 

PLATFORM_SRC := $(shell find $(PLATFORM_SOURCE) -name "*" -type f) 

OBJ := $(shell find $(OBJECTS) -name "*" -type f) 

build: 
	$(shell rm -drf $(OBJECTS))
	$(shell mkdir $(OBJECTS))

	$(foreach path,$(MODULE_SRC),$(shell mkdir -p $(shell dirname $(patsubst $(MODULE_SOURCE)/%,$(MODULE_OBJECTS)/%,$(path)))))
	$(foreach path,$(MODULE_SRC),$(shell $(CC) $(CFLAGS) -I$(MODULE_INCLUDE) -I$(PLATFORM_INCLUDE) -x c++ -c $(path) -o $(patsubst $(MODULE_SOURCE)/%,$(MODULE_OBJECTS)/%,$(path))))
	
	$(foreach path,$(PLATFORM_SRC),$(shell mkdir -p $(shell dirname $(patsubst $(PLATFORM_SOURCE)/%,$(PLATFORM_OBJECTS)/%,$(path)))))
	$(foreach path,$(PLATFORM_SRC),$(shell $(CC) $(CFLAGS) -I$(MODULE_INCLUDE) -I$(PLATFORM_INCLUDE) -x c++ -c $(path) -o $(patsubst $(PLATFORM_SOURCE)/%,$(PLATFORM_OBJECTS)/%,$(path))))
	
	$(shell mkdir -p $(TARGET))
	$(shell $(CC) $(CFLAGS) -o $(TARGET)/app $(OBJ))



