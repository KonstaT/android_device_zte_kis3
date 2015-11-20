/*
 * Copyright (C) 2015 The CyanogenMod Project
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

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/syscall.h>

#include <linux/ioprio.h>

/*
 * FUNCTION: ioprio_set
 * USE:      INTERPOSE: Remaps to syscall(SYS_ioprio_set, ...)
 * NOTES:    This function no longer exists in M, instead remap this function
 *           make the appropriate syscall instead.
 */
int ioprio_set(int which, int who, int ioprio)
{
    return syscall(SYS_ioprio_set, which, who, ioprio);
}
