/*
 * Copyright (C) 2014 The CyanogenMod Project
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

import org.cyanogenmod.internal.util.FileUtils;

public class DisplayColorCalibration {

    private static final String KCAL_TUNING_FILE = "/sys/devices/virtual/graphics/fb0/kcal";

    public static boolean isSupported() {
        return FileUtils.isFileWritable(KCAL_TUNING_FILE);
    }

    public static int getMaxValue() {
        return 255;
    }

    public static int getMinValue() {
        return 35;
    }

    public static int getDefValue() {
        return 255;
    }

    public static String getCurColors() {
        return FileUtils.readOneLine(KCAL_TUNING_FILE);
    }

    public static boolean setColors(String colors) {
        return FileUtils.writeLine(KCAL_TUNING_FILE, colors);
    }
}
