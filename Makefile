all: lib bin bin/mandelbrot

lib:
	git clone --depth 1 https://github.com/logiclogue/mandelbrot-set-cpp lib
	make -C lib

bin:
	mkdir bin

bin/mandelbrot:
	cp lib/build/main bin/mandelbrot

clean:
	rm -rf lib
	rm -rf bin
