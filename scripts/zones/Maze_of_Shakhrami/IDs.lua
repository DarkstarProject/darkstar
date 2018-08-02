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
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        FOSSIL_EXTRACTED        = 7048, -- A large fossil has been excavated from here.
        NOTHING_FOSSIL          = 7049, -- It looks like a rock with fossils embedded in it. Nothing out of the ordinary.
        CONQUEST_BASE           = 7076, -- Tallying conquest results...
        DEVICE_NOT_WORKING      = 7249, -- The device is not working.
        SYS_OVERLOAD            = 7258, -- arning! Sys...verload! Enterin...fety mode. ID eras...d
        YOU_LOST_THE            = 7263, -- You lost the #.
        CHEST_UNLOCKED          = 7353, -- You unlock the chest!
        CHEST_FAIL              = 7354, -- Fails to open the chest.
        CHEST_TRAP              = 7355, -- The chest was trapped!
        CHEST_WEAK              = 7356, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7357, -- The chest was a mimic!
        CHEST_MOOGLE            = 7358, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7359, -- The chest was but an illusion...
        CHEST_LOCKED            = 7360, -- The chest appears to be locked.
        MINING_IS_POSSIBLE_HERE = 7361, -- Mining is possible here if you have
        NOTHING_OUT_OF_ORDINARY = 7370, -- There is nothing out of the ordinary here.
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
    },
}

return zones[dsp.zone.MAZE_OF_SHAKHRAMI]