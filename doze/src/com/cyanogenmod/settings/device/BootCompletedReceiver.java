/*
 * Copyright (c) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;

import java.io.File;

public class BootCompletedReceiver extends BroadcastReceiver {

    private static final boolean DEBUG = false;
    private static final String TAG = "DozeService";

    @Override
    public void onReceive(final Context context, Intent intent) {
        if (!hasProximitySensor()) {
            PackageManager pm  = context.getPackageManager();
            if (pm != null) {
                if (DEBUG) Log.d(TAG, "Disabling gesture settings");
                ComponentName gestureSettings = new ComponentName("com.cyanogenmod.settings.device",
                        "com.cyanogenmod.settings.device.TouchscreenGestureSettings");
                pm.setComponentEnabledSetting(gestureSettings,
                        PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                        PackageManager.DONT_KILL_APP);
            }
        }

        if (DEBUG) Log.d(TAG, "Starting service");
        context.startService(new Intent(context, DozeService.class));
    }

    private boolean hasProximitySensor() {
        return new File("/proc/driver/alsprx").exists();
    }
}
