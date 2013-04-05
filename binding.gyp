{
    "targets": [
        {
            "target_name": "zipper",
            "variables": {
                "libzip%": "0.10"
            },
            "sources": [
                "src/_zipper.cc",
                "src/zipper.cpp"
            ],
            "include_dirs": [
                "deps/libzip-<(libzip)/lib/"
            ],
            "libraries": [
                "-L../deps/libzip-<(libzip)/lib/.libs/",
                "-lzip"
            ]
        }
    ]
}
