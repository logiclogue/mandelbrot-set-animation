DEP=https://github.com/logiclogue/mandelbrot-set-cpp
LIBDIR=lib
BUILDDIR=build
BINDIR=bin
SRCDIR=src
BIN=mandelbrot
ANIMATIONS=$(shell ls $(DIRSRC)/*.sh)

all: install

install: $(LIBDIR) $(BINDIR) $(BINDIR)/$(BIN)

$(LIBDIR):
	git clone --depth 1 $(DEP) $(LIBDIR)
	make -C $(LIBDIR)

$(BINDIR):
	mkdir $(BINDIR)

$(BINDIR)/$(BIN):
	cp $(LIBDIR)/build/main $(BINDIR)/$(BIN)

clean:
	rm -rf $(LIBDIR)
	rm -rf $(BINDIR)
