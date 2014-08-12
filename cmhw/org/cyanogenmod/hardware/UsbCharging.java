/*
 * Copyright (C) 2013 The CyanogenMod Project
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

package org.cyanogenmod.hardware;

import org.cyanogenmod.hardware.util.FileUtils;

import java.io.File;

public class UsbCharging {

    private static String USB_CHARGING_PATH = "/sys/class/power_supply/battery/charging_enabled";

    public static boolean isSupported() {
        File file = new File(USB_CHARGING_PATH);
        return file.exists();
    }

    public static boolean isEnabled() {
        try {
            String value = FileUtils.readOneLine(USB_CHARGING_PATH);
            if (value == null) {
                return false;
            }
            return Integer.parseInt(value) == 1;
        } catch (NumberFormatException nfex) {
            return false;
        }
    }

    public static boolean setEnabled(boolean status) {
        return FileUtils.writeLine(USB_CHARGING_PATH, status ? "1" : "0");
    }
}
