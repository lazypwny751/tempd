PREFIX := /usr
BINDIR := $(PREFIX)/bin
LIBDIR := $(PREFIX)/local/lib/bash/5.1

install:
	mkdir -vp $(BINDIR) $(LIBDIR)
	install -vm 755 tempd.sh $(LIBDIR)/tempd.sh

uninstall:
	rm -vrf $(LIBDIR)/tempd.sh

missing:
	$(MAKE) -C src

reinstall: uninstall install

.PHONY: install uninstall missing reinstall
