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
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        FOSSIL_EXTRACTED        = 7048, -- A large fossil has been excavated from here.
        NOTHING_FOSSIL          = 7049, -- It looks like a rock with fossils embedded in it. Nothing out of the ordinary.
        CONQUEST_BASE           = 7076, -- Tallying conquest results...
        DEVICE_NOT_WORKING      = 7249, -- The device is not working.
        SYS_OVERLOAD            = 7258, -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE            = 7263, -- You lost the <item>.
        CHEST_UNLOCKED          = 7353, -- You unlock the chest!
        CHEST_FAIL              = 7354, -- <name> fails to open the chest.
        CHEST_TRAP              = 7355, -- The chest was trapped!
        CHEST_WEAK              = 7356, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7357, -- The chest was a mimic!
        CHEST_MOOGLE            = 7358, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7359, -- The chest was but an illusion...
        CHEST_LOCKED            = 7360, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
        MINING_IS_POSSIBLE_HERE = 7361, -- Mining is possible here if you have <item>.
        REGIME_REGISTERED       = 10347, -- New training regime registered!
    },
    mob =
    {
        ICHOROUS_IRE   = 17588225,
        ARGUS          = 17588674,
        LEECH_KING     = 17588685,
        WYRMFLY_OFFSET = 17588701,
        LOST_SOUL      = 17588706,
    },
    npc =
    {
        FOSSIL_ROCK_OFFSET       = 17588737,
        SHAKHRAMI_TREASURE_CHEST = 17588773,
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