CAF Android device configuration for [ZTE Open C / Kis 3](http://www.modaco.com/topic/373718-CAF-Android/).

How to build:
-------------

Initialize CAF Android build environment:

    repo init -u git://codeaurora.org/platform/manifest.git -b release -m LNX.LA.3.5.1-00710-8x10.0.xml
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_kis3.xml -O -L https://raw.githubusercontent.com/KonstaT/android_device_zte_kis3/LNX.LA.3.5.1/patches/manifest_zte_kis3.xml
    repo sync

Compile:

    . build/envsetup.sh
    lunch kis3-userdebug
    make otapackage
