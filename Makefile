DEP=https://github.com/logiclogue/mandelbrot-set-cpp
LIBDIR=lib
BINDIR=bin

all: lib bin bin/mandelbrot

$(LIBDIR):
	git clone --depth 1 $(DEP) $(LIBDIR)
	make -C $(LIBDIR)

$(BINDIR):
	mkdir $(BINDIR)

bin/mandelbrot:
	cp $(LIBDIR)/build/main $(BINDIR)/mandelbrot

clean:
	rm -rf $(LIBDIR)
	rm -rf $(BINDIR)
