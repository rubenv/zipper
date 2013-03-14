LIBZIP=0.10

.PHONY:all

all: lib/_zipper.node

lib/_zipper.node: deps/libzip-$(LIBZIP) build/Makefile
	node-gyp build

build/Makefile: binding.gyp
	node-gyp configure

deps/libzip-$(LIBZIP): deps/libzip-$(LIBZIP).tar.bz2
	tar xpf $< -C deps
	./deps/build-libzip.sh $(LIBZIP)

clean:
	-rm -rf build deps/libzip-*/
