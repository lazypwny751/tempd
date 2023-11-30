PREFIX := /usr
BINDIR := $(PREFIX)/bin
LIBDIR := $(PREFIX)/local/lib/bash/5.1

install:
	mkdir -vp $(BINDIR) $(LIBDIR)
	install -vm 755 tempd.sh $(LIBDIR)/tempd.sh
	ln -s $(LIBDIR)/tempd.sh $(BINDIR)/tempd

uninstall:
	rm -vf $(LIBDIR)/tempd.sh $(BINDIR)/tempd

missing:
	$(MAKE) -C missing/*

reinstall: uninstall install

.PHONY: install uninstall missing reinstall
