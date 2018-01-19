Arrapago = {

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

        -- Other Texts
        DOOR_IS_SEALED            = 7460, -- The door is sealed...
        DOOR_IS_SEALED_MYSTERIOUS = 7463, -- The door is sealed by some mysterious force...

        -- Salvage Texts
        SALVAGE_START          = 7234, -- You feel an incredible pressure bearing down on you. This area appears to be blanketed in some sort of intense psionic field...
        TIME_TO_COMPLETE       = 7441, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED         = 7442, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES = 7446, -- Time remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS = 7447, -- Time remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN           = 7449  -- All party members have fallen in battle. Mission failure in <number> [minute/minutes].
    },
    
    mobs = {
        -- Arrapago Remnants
        [1] = {
            [2] = {
                mobs_start = 17080323,
                mobs_end = 17080395,
                rampart = 17080321,
                sabotender = 17080322,
            }
        },
        [2] = {
            [1] = {
                mobs_start = 17080421,
                mobs_end = 17080430,
            },
            [2] = {
                mobs_start = 17080413,
                mobs_end = 17080420,
            },
            [3] = {
                mobs_start = 17080404,
                mobs_end = 17080412,
            },
            [4] = {
                mobs_start = 17080396,
                mobs_end = 17080403,
            },
            astrologer = 17080431,
        }
    },
    
    npcs = {
        [1] = {
            [1] = {
                DOOR1 = 17080974,
            },
            [2] = {
                ARMORY_CRATE = 17080594,
            }
        }
    }
}

return Arrapago;
