PREFIX := /usr
BINDIR := $(PREFIX)/bin
CC := gcc

all: build install

build:
	$(CC) mkdir.c -o mkdir

install:
	@echo ok

clean:
	rm -vf mkdir

.PHONY: build install clean
