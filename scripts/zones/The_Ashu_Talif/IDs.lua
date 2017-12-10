TheAshuTalif = {

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
        TIME_TO_COMPLETE       = 7402, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED         = 7403, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES = 7407, -- Time remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS = 7408, -- Time remaining: <number> [second/seconds] (Earth time).
        FADES_INTO_NOTHINGNESS = 7409, -- The <itemZ fades into nothingness...
        PARTY_FALLEN           = 7410, -- All party members have fallen in battle. Mission failure in <number> [minute/minutes].

        -- The Black Coffin
        BATTLE_HIGH_SEAS      = 7565, -- A battle on the high seas? My warrior's spirit soars in anticipation!
        TIME_IS_NEAR          = 7566, -- My time is near...
        SO_I_FALL             = 7567, -- And so I fall...
        SWIFT_AS_LIGHTNING    = 7568, -- Swift as lightning...!
        HARNESS_THE_WHIRLWIND = 7569, -- Harness the whirlwind...!
        STING_OF_MY_BLADE     = 7570, -- Feel the sting of my blade!
        UNNATURAL_CURS        = 7571, -- Unnatural curs!
        OVERPOWERED_CREW      = 7572, -- You have overpowered my crew...
        TEST_YOUR_BLADES      = 7573, -- I will test your blades. Prepare to join your ancestors...
        FOR_THE_BLACK_COFFIN  = 7574, -- For the Black Coffin!
        FOR_EPHRAMAD          = 7575, -- For Ephramad!
        TROUBLESOME_SQUABS    = 7576  -- Troublesome squabs...
    },

    mobs = {
        -- The Black Coffin - Wave 1
        GESSHO = 17022979,
        [1] = {
            ASHU_TALIF_CREW_1 = 17022980,
            ASHU_TALIF_CREW_2 = 17022981,
            ASHU_TALIF_CREW_3 = 17022982,
            ASHU_TALIF_CREW_4 = 17022983,
            ASHU_TALIF_CREW_5 = 17022984,
        },
        -- The Black Coffin - Wave 2
        [2] = {
            ASHU_TALIF_CAPTAIN = 17022985,
            ASHU_TALIF_CREW_6 = 17022986,
            ASHU_TALIF_CREW_7 = 17022987,
            ASHU_TALIF_CREW_8 = 17022988,
            ASHU_TALIF_CREW_9 = 17022989,
        }
    },
}

return TheAshuTalif
