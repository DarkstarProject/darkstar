Periqia = {

    text = {
        -- General Texts
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6391, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL        = 6392, -- You do not have enough gil.
        ITEMS_OBTAINED             = 6396, -- You obtain <number> <item>!

        -- Assault Texts
        ASSAULT_31_START        = 7476, -- Commencing <assault>! Objective: Escort the prisoner
        ASSAULT_32_START        = 7477, -- Commencing <assault>! Objective: Destroy the undead
        ASSAULT_33_START        = 7478, -- Commencing <assault>! Objective: Find the survivors
        ASSAULT_34_START        = 7479, -- Commencing <assault>! Objective: Eliminate the Black Baron
        ASSAULT_35_START        = 7480, -- Commencing <assault>! Objective: Activate the bridge
        ASSAULT_36_START        = 7481, -- Commencing <assault>! Objective: xterminate the chigoes
        ASSAULT_37_START        = 7482, -- Commencing <assault>! Objective: Clear the mine fields
        ASSAULT_38_START        = 7483, -- Commencing <assault>! Objective: Locate the generals
        ASSAULT_39_START        = 7484, -- Commencing <assault>! Objective: Retrieve the Mark-IIs
        ASSAULT_40_START        = 7485, -- Commencing <assault>! Objective: Assassinate King Goldemar
        TIME_TO_COMPLETE        = 7506, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED          = 7507, -- The mission has failed. Leaving area.
        RUNE_UNLOCKED_POS       = 7508, -- Mission objective completed. Unlocking Rune of Release <rune>.
        RUNE_UNLOCKED           = 7509, -- Mission objective completed. Unlocking Rune of Release.
        ASSAULT_POINTS_OBTAINED = 7510, -- You gain <number> [Assault point/Assault points]!
        TIME_REMAINING_MINUTES  = 7511, -- Time remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS  = 7512, -- Time remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN            = 7514, -- All party members have fallen in battle. Mission failure in <number> [minute/minutes].

        -- Seagull Grounded
        EXCALIACE_START      = 7523, -- Such a lot of trouble for one little corsair... Shall we be on our way?
        EXCALIACE_END1       = 7524, -- Yeah, I got it. Stay here and keep quiet.
        EXCALIACE_END2       = 7525, -- Hey... It was a short trip, but nothing is ever dull around you, huh?
        EXCALIACE_ESCAPE     = 7526, -- Heh. The Immortals really must be having troubles finding troops if they sent this bunch of slowpokes to watch over me...
        EXCALIACE_PAIN1      = 7527, -- Oomph!
        EXCALIACE_PAIN2      = 7528, -- Ouch!
        EXCALIACE_PAIN3      = 7529, -- Youch!
        EXCALIACE_PAIN4      = 7530, -- Damn, that's gonna leave a mark!
        EXCALIACE_PAIN5      = 7531, -- Urggh!
        EXCALIACE_CRAB1      = 7532, -- Over to you.
        EXCALIACE_CRAB2      = 7533, -- What's this guy up to?
        EXCALIACE_CRAB3      = 7534, -- Uh-oh.
        EXCALIACE_DEBAUCHER1 = 7535, -- Wh-what the...!?
        EXCALIACE_DEBAUCHER2 = 7536, -- H-help!!!
        EXCALIACE_RUN        = 7537, -- Now's my chance!
        EXCALIACE_TOO_CLOSE  = 7538, -- Okay, okay, you got me! I promise I won't run again if you step back a bit...please. Someone's been eating too much garlic...
        EXCALIACE_TIRED      = 7539, -- <Pant>...<wheeze>...
        EXCALIACE_CAUGHT     = 7540, -- Damn...
    },

    mobs = {
        -- Seagull Grounded
        [31] = {
            CRAB1 = 17006594,
            CRAB2 = 17006595,
            CRAB3 = 17006596,
            CRAB4 = 17006597,
            CRAB5 = 17006598,
            CRAB6 = 17006599,
            CRAB7 = 17006600,
            CRAB8 = 17006601,
            CRAB9 = 17006602,
            DEBAUCHER1 = 17006603,
            PUGIL1 = 17006604,
            PUGIL2 = 17006605,
            PUGIL3 = 17006606,
            PUGIL4 = 17006607,
            PUGIL5 = 17006608,
            DEBAUCHER2 = 17006610,
            DEBAUCHER3 = 17006611,
        },
        -- Shades of Vengeance
        [79] = {
            K23H1LAMIA1 = 17006754,
            K23H1LAMIA2 = 17006755,
            K23H1LAMIA3 = 17006756,
            K23H1LAMIA4 = 17006757,
            K23H1LAMIA5 = 17006758,
            K23H1LAMIA6 = 17006759,
            K23H1LAMIA7 = 17006760,
            K23H1LAMIA8 = 17006761,
            K23H1LAMIA9 = 17006762,
            K23H1LAMIA10 = 17006763,
        }
    },

    npcs = {
        EXCALIACE = 17006593,
        ANCIENT_LOCKBOX = 17006809,
        RUNE_OF_RELEASE = 17006810,
        _1K1 = 17006840,
        _1K2 = 17006841,
        _1K3 = 17006842,
        _1K4 = 17006843,
        _1K5 = 17006844,
        _1K6 = 17006845,
        _1K7 = 17006846,
        _1K8 = 17006847,
        _1K9 = 17006848,
        _1KA = 17006849,
        _1KB = 17006850,
        _1KC = 17006851,
        _1KD = 17006852,
        _1KE = 17006853,
        _1KF = 17006854,
        _1KG = 17006855,
        _1KH = 17006856,
        _1KI = 17006857,
        _1KJ = 17006858,
        _1KK = 17006859,
        _1KL = 17006860,
        _1KM = 17006861,
        _1KN = 17006862,
        _1KO = 17006863,
        _1KP = 17006864,
        _1KQ = 17006865,
        _1KR = 17006866,
        _1KS = 17006867,
        _1KT = 17006868,
        _1KU = 17006869,
        _1KV = 17006870,
        _1KW = 17006871,
        _1KX = 17006872,
        _1KY = 17006873,
        _1KZ = 17006874,
        _JK0 = 17006875,
        _JK1 = 17006876,
        _JK2 = 17006877,
        _JK3 = 17006878,
        _JK4 = 17006879,
        _JK5 = 17006880,
        _JK6 = 17006881,
        _JK7 = 17006882,
        _JK8 = 17006883,
        _JK9 = 17006884,
        _JKA = 17006885,
        _JKB = 17006886,
        _JKC = 17006887,
        _JKD = 17006888,
        _JKE = 17006889,
        _JKF = 17006890,
        _JKG = 17006891,
        _JKH = 17006892,
        _JKI = 17006893,
        _JKJ = 17006894,
        _JKK = 17006895,
        _JKL = 17006896,
        _JKM = 17006897,
        _JKN = 17006898,
        _JKO = 17006899,
    }
}
