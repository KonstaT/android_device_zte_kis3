#!/system/bin/sh

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

if [ -f /firmware/verinfo/ver_info.txt ]; then
    setprop gsm.version.baseband `head -1 /firmware/verinfo/ver_info.txt`
fi
