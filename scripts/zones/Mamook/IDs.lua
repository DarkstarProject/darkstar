-----------------------------------
-- Area: Mamook
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MAMOOK] =
{
    text =
    {
        NOTHING_HAPPENS          = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388, -- Obtained: <item>.
        GIL_OBTAINED             = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET   = 7049, -- You can't fish here.
        LOGGING_IS_POSSIBLE_HERE = 7534, -- Logging is possible here if you have <item>.
        SICKLY_SWEET             = 8662, -- A sickly sweet fragrance pervades the air...
        DRAWS_NEAR               = 8666, -- Something draws near!
        COMMON_SENSE_SURVIVAL    = 9537, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        ZIZZY_ZILLAH_PH =
        {
            [17043560] = 17043554,
            [17043561] = 17043554,
            [17043562] = 17043554,
            [17043563] = 17043554,
            [17043564] = 17043554,
        },
        FIREDANCE_MAGMAAL_JA_PH =
        {
            [17043773] = 17043779, -- -201.522 17.209 -363.865
            [17043774] = 17043779, -- -206.458 17.525 -373.798
        },
        GULOOL_JA_JA   = 17043875,
        CHAMROSH       = 17043887,
        IRIRI_SAMARIRI = 17043888,
    },
    npc =
    {
        LOGGING =
        {
            17044014,
            17044015,
            17044016,
            17044017,
            17044018,
            17044019,
        },
    },
}

return zones[dsp.zone.MAMOOK]