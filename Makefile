LIBZIP=0.10

all: lib/_zipper.node

lib/_zipper.node: deps/libzip-$(LIBZIP) build/Makefile
	node-gyp build

build/Makefile: binding.gyp
	node-gyp configure

deps/libzip-$(LIBZIP): deps/libzip-$(LIBZIP).tar.bz2
	tar xpf $< -C deps

clean:
	-rm -rf build
	-rm lib/_zipper.node
