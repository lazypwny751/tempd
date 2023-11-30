PREFIX := /usr
BINDIR := $(PREFIX)/bin
CC := gcc

all: build install

build:
	$(CC) mkdir.c -o mkdir

install:
	install -vm 755 mkdir $(BINDIR)/mkdir

clean:
	rm -vf mkdir

.PHONY: build install clean
