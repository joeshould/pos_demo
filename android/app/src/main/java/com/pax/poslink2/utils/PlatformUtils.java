/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2/24/2021
 * Module Auth: Fahy.F
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2/24/2021              Fahy.F                       Create
 * ============================================================================
 */
package com.pax.poslink2.utils;

import android.os.Build;

public class PlatformUtils {

    public static boolean isPAXAndroid() {
        return Build.DISPLAY.toLowerCase().startsWith("paydroid") ||
                Build.MANUFACTURER.equalsIgnoreCase("pax") ||
                Build.BRAND.equalsIgnoreCase("pax") ||
                Build.FINGERPRINT.toLowerCase().startsWith("pax") ||
                Build.VERSION.INCREMENTAL.toLowerCase().startsWith("paydroid");
    }
}
