Vanilla BlueLightning
===============

Getting started
---------------
First you must initialize a repository with BlueLightning sources:

    repo init -u git://github.com/Racing1/platform_manifest.git -b jb-4.1.2

then

    repo sync

*This might take a few hours depending on your internet connection.


Building Vanilla BlueLightning
------------------------

To build BlueLightning you must cd to the working directory.

Now you can run the build script:

    ./build-bluelightning.sh -device- -sync- -thread-


* device: Choose between the following supported devices:t769, i9100, i9100p, i9100g, i9300 and d2att.

* sync: Will sync latest BlueLightning sources before building
* threads: Allows to choose a number of threads for syncing and building operation.


ex: ./build-BlueLightning.sh t769 sync 12 (This will sync latest sources, build BlueLightning for Galaxy Blaze with -j12 threads)



You might want to consider using CCACHE to speed up build time after the first build.

This will make a signed flashable zip file located in out/target/product/-device-/BlueLightning-JB-(Device)-Nightly-(Date).zip


