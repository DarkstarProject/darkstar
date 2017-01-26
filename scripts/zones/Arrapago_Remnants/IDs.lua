Arrapago = {

    text = {
        -- General Texts
        ITEM_CANNOT_BE_OBTAINED = 6379, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED = 6384, -- Obtained: <item>
        GIL_OBTAINED = 6385, -- Obtained <number> gil
        KEYITEM_OBTAINED = 6387, -- Obtained key item: <keyitem>

        DOOR_IS_SEALED = 7457,
        DOOR_IS_SEALED_MYSTERIOUS = 7460,

        -- Salvage Texts
        SALVAGE_START = 7231,
        TIME_TO_COMPLETE = 7438,
        MISSION_FAILED = 7439,
        TIME_REMAINING_MINUTES = 7443,
        TIME_REMAINING_SECONDS = 7444,
        PARTY_FALLEN = 7446
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
