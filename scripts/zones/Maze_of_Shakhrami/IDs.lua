-----------------------------------
-- Area: Maze_of_Shakhrami
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MAZE_OF_SHAKHRAMI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        FOSSIL_EXTRACTED        = 7049, -- A large fossil has been excavated from here.
        NOTHING_FOSSIL          = 7050, -- It looks like a rock with fossils embedded in it. Nothing out of the ordinary.
        CONQUEST_BASE           = 7077, -- Tallying conquest results...
        DEVICE_NOT_WORKING      = 7250, -- The device is not working.
        SYS_OVERLOAD            = 7259, -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE            = 7264, -- You lost the <item>.
        CHEST_UNLOCKED          = 7355, -- You unlock the chest!
        MINING_IS_POSSIBLE_HERE = 7363, -- Mining is possible here if you have <item>.
        REGIME_REGISTERED       = 10349, -- New training regime registered!
    },
    mob =
    {
        TREMBLER_TABITHA_PH =
        {
            [17588276] = 17588278,
            [17588277] = 17588278,
        },
        ICHOROUS_IRE   = 17588225,
        ARGUS          = 17588674,
        LEECH_KING     = 17588685,
        WYRMFLY_OFFSET = 17588701,
        LOST_SOUL      = 17588706,
    },
    npc =
    {
        FOSSIL_ROCK_OFFSET = 17588737,
        TREASURE_CHEST     = 17588773,
        EXCAVATION =
        {
            17588774,
            17588775,
            17588776,
            17588777,
            17588778,
            17588779,
        },
    },
}

return zones[dsp.zone.MAZE_OF_SHAKHRAMI]