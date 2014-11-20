CyanogenMod 12 device configuration for [ZTE Open C / Kis 3](http://www.modaco.com/topic/373968-cyanogenmod-12/).

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-12.0
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_kis3.xml -O -L https://raw.githubusercontent.com/legaCyMod/android_local_manifest/cm-12.0/manifest_zte_kis3.xml
    repo sync

Compile:

    . build/envsetup.sh
    brunch kis3
