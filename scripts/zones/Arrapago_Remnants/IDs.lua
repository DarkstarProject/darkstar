-----------------------------------
-- Area: Arrapago_Remnants
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ARRAPAGO_REMNANTS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6391, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL        = 6392, -- You do not have enough gil.
        ITEMS_OBTAINED             = 6396, -- You obtain <number> <item>!
        SALVAGE_START              = 7234, -- You feel an incredible pressure bearing down on you. This area appears to be blanketed in some sort of intense psionic field...
        TIME_TO_COMPLETE           = 7441, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED             = 7442, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES     = 7446, -- ime remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS     = 7447, -- ime remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN               = 7449, -- ll party members have fallen in battle. Mission failure in <number> [minute/minutes].
        DOOR_IS_SEALED             = 7460, -- The door is sealed...
        DOOR_IS_SEALED_MYSTERIOUS  = 7463, -- The door is sealed by some mysterious force...
        CELL_OFFSET                = 7211, -- message for Cell usage removal
    },
    mob =
    {
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
                princess = 17080597,
            },
            [3] = {
                mobs_start = 17080404,
                mobs_end = 17080412,
                wahzil = 17080596,
            },
            [4] = {
                mobs_start = 17080396,
                mobs_end = 17080403,
            },
            astrologer = 17080431,
        },
        [3] = {
            [1] = {
                mobs_start = 17080432,
                mobs_end = 17080451,
            },
            [2] = {
                mobs_start = 17080454,
                mobs_end = 17080474,
            },
            treasure_hunter1 = 17080452,
            treasure_hunter2 = 17080475,
        },
        [4] = {
            [1] = {
                mobs_start = 17080477,
                mobs_end = 17080494,
            },
            [2] = {
                mobs_start = 17080497,
                mobs_end = 17080512,
                Rose = 17080513,
            },
            treasure_hunter1 = 17080514,
            treasure_hunter2 = 17080495,
        },
        [5] = {
            [1] = {
                [1] = {
                mobs_start = 17080516, 
                mobs_end = 17080519,
                },
                [2] = {
                mobs_start = 17080521,
                mobs_end = 17080522,
                },
                [3] = {
                mobs_start = 17080526,
                mobs_end = 17080530,
                },
                astrologer = 17080520,
                rampart1 = 17080523,
                manta = 17080524,
                manta2 = 17080531,
                rampart2 = 17080533,
                pugil = 17080534,
                chariot = 17080537,
            },
            [2] = {
                [1] = {
                mobs_start = 17080538, 
                mobs_end = 17080541,
                },
                [2] = {
                mobs_start = 17080543,
                mobs_end = 17080544,
                },
                [3] = {
                mobs_start = 17080549,
                mobs_end = 17080553,
                },
                astrologer = 17080542,
                goobbue = 17080554,
                rampart1 = 17080545,
                mandy = 17080546,
                rampart2 = 17080555,
                goobbue2 = 17080556,
                chariot = 17080558,
            },
        },
        [6] = {
            [1] = {
                mobs_start = 17080562,
                mobs_end = 17080569,
            },
            rampart1 = 17080559,
            treant = 17080560,
            rampart2 = 17080570,
            treant2 = 17080571,
            rampart3 = 17080577,
            sapling = 17080578,
            rampart4 = 17080581,
            korrigan = 17080582,
            treasure_hunter1 = 17080573,
            treasure_hunter2 = 17080575,
        },
        [7] = {
            [1] = {
            chariot = 17080585,    
            },
        },
    },
    npc =
    {
        [1] = {
            [1] = {
                DOOR1 = 17080974,
            },
            [2] = {
                ARMORY_CRATE = 17080586,
            },
            [3] = {
                DOOR1 = 17080975,
                DOOR2 = 17080976,
                DOOR3 = 17080977,
                DOOR4 = 17080978,  
            },
        },
        [2] = {
            [1] = {
                DOOR1 = 17080979,
                DOOR2 = 17080980,
                DOOR3 = 17080981,
                DOOR4 = 17080982,
            },
            [2] = {
                SOCKET = 17080941,
                SLOT = 17080942,
            },
        },
        [3] = {
            [1] = {
                DOOR1 = 17080983,
                DOOR2 = 17080984,
            },
        },
        [4] = {
            [1] = {
                DOOR1 = 17080985,
                DOOR2 = 17080986,
            },
        },
        [5] = {
            [1] = {
                DOOR1 = 17080987,
                DOOR2 = 17080988,
            },
        },
        [6] = {
            DOOR = 17080989,
        },
    },
}

return zones[dsp.zone.ARRAPAGO_REMNANTS]