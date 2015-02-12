/*
 * Copyright (C) 2015, The CyanogenMod Project
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

//#define LOG_NDEBUG 0

#define LOG_TAG "wcnss_qmi"

#define SUCCESS 0
#define FAILED -1

#define MAC_INFO_FILE "/persist/wifimac.dat"

#include <cutils/log.h>
#include <stdio.h>

int wcnss_init_qmi(void)
{
    /* empty */
    return SUCCESS;
}

int wcnss_qmi_get_wlan_address(unsigned char *mac)
{
    int i;
    int wifi_addr[6];
    FILE *f;

    if ((f = fopen(MAC_INFO_FILE, "r")) == NULL) {
        ALOGE("%s: failed to open %s", __func__, MAC_INFO_FILE);
        return FAILED;
    }

    if (fscanf(f, "wifiaddr:0x%02X 0x%02X 0x%02X 0x%02X 0x%02X 0x%02X",
            &wifi_addr[0], &wifi_addr[1], &wifi_addr[2],
            &wifi_addr[3], &wifi_addr[4], &wifi_addr[5]) != 6) {
        ALOGE("%s: %s: file contents are not valid", __func__, MAC_INFO_FILE);
        fclose(f);
        return FAILED;
    } else {
        for (i = 0; i < 6; i++) mac[i] = wifi_addr[i];
    }

    fclose(f);
    return SUCCESS;
}

void wcnss_qmi_deinit(void)
{
    /* empty */
}
