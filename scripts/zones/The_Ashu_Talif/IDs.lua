TheAshuTalif = {

    text = {
        -- General Texts
        ITEM_CANNOT_BE_OBTAINED = 6379; -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED = 6385; -- Obtained: <item>
        GIL_OBTAINED = 6386; -- Obtained <number> gil
        KEYITEM_OBTAINED = 6388; -- Obtained key item: <keyitem>

        -- Assault Texts
        TIME_TO_COMPLETE = 7400, -- to complete this mission
        MISSION_FAILED = 7401, -- The mission has failed. Leaving area
        TIME_REMAINING_MINUTES = 7405, -- minute/minutes
        TIME_REMAINING_SECONDS = 7406, -- second/seconds
        FADES_INTO_NOTHINGNESS = 7407, -- fades into nothingness
        PARTY_FALLEN = 7408, -- party members have fallen in battle. Mission failure in

        -- The Black Coffin
        BATTLE_HIGH_SEAS = 7563,
        TIME_IS_NEAR = 7564,
        SO_I_FALL = 7565,
        SWIFT_AS_LIGHTNING = 7566,
        HARNESS_THE_WHIRLWIND = 7567,
        STING_OF_MY_BLADE = 7568,
        UNNATURAL_CURS = 7569,
        OVERPOWERED_CREW = 7570,
        TEST_YOUR_BLADES = 7571,
        FOR_THE_BLACK_COFFIN = 7572,
        FOR_EPHRAMAD = 7573,
        TROUBLESOME_SQUABS = 7574
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
