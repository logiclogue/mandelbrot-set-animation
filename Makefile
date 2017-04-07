DEP=https://github.com/logiclogue/mandelbrot-set-cpp
LIBDIR=lib
BUILDDIR=build
BINDIR=bin
SRCDIR=src
BIN=mandelbrot
ANIMATION=$(shell ls $(DIRSRC))

all: install

install: $(LIBDIR) $(BINDIR) $(BINDIR)/$(BIN)

$(LIBDIR):
	git clone --depth 1 $(DEP) $(LIBDIR)
	make -C $(LIBDIR)

$(BINDIR):
	mkdir $(BINDIR)

$(BINDIR)/$(BIN):
	cp $(LIBDIR)/build/main $(BINDIR)/$(BIN)

$(BUILDDIR)/%: $(SRCDIR)/%.sh
	bash $<

clean:
	rm -rf $(LIBDIR)
	rm -rf $(BINDIR)
