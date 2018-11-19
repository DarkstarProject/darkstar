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
        ITEM_CANNOT_BE_OBTAINED    = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388, -- Obtained: <item>.
        GIL_OBTAINED               = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391, -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6392, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL        = 6393, -- You do not have enough gil.
        ITEMS_OBTAINED             = 6397, -- You obtain <number> <item>!
        SALVAGE_START              = 7235, -- You feel an incredible pressure bearing down on you. This area appears to be blanketed in some sort of intense psionic field...
        TIME_TO_COMPLETE           = 7442, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED             = 7443, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES     = 7447, -- ime remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS     = 7448, -- ime remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN               = 7450, -- ll party members have fallen in battle. Mission failure in <number> [minute/minutes].
        DOOR_IS_SEALED             = 7461, -- The door is sealed...
        DOOR_IS_SEALED_MYSTERIOUS  = 7464, -- The door is sealed by some mysterious force...
        CELL_OFFSET                = 7212, -- Main Weapon/Sub-Weapon restriction removed.
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
    npc =
    {
        [1] = {
            [1] = {
                DOOR1 = 17080974,
            },
            [2] = {
                ARMORY_CRATE = 17080594,
            }
        }
    },
}

return zones[dsp.zone.ARRAPAGO_REMNANTS]