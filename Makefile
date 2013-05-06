LIBZIP=0.10

.PHONY:all

all: lib/_zipper.node


build/Makefile: binding.gyp
	node-gyp configure

ifeq ($(shell uname), Darwin)
lib/_zipper.node: deps/libzip-$(LIBZIP) build/Makefile
	node-gyp build

deps/libzip-$(LIBZIP): deps/libzip-$(LIBZIP).tar.bz2
	tar xpf $< -C deps
	./deps/build-libzip.sh $(LIBZIP)
endif

ifeq ($(shell uname), Linux)
lib/_zipper.node: build/Makefile
	node-gyp build
endif

clean:
	-rm -rf build deps/libzip-*/
