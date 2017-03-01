LineageOS 14.1 device configuration for [ZTE Open C / Kis 3](http://konstakang.com/devices/kis3/CM14.1).

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/LineageOS/android.git -b cm-14.1
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_kis3.xml -O -L https://raw.githubusercontent.com/legaCyMod/android_local_manifest/cm-14.1/manifest_zte_kis3.xml
    repo sync

Compile:

    . build/envsetup.sh
    brunch kis3
