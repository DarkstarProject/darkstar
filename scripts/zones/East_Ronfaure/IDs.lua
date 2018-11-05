-----------------------------------
-- Area: East_Ronfaure
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.EAST_RONFAURE] =
{
    text =
    {
        NOTHING_HAPPENS          = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6403, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6409, -- Obtained: <item>.
        GIL_OBTAINED             = 6410, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6412, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6423, -- There is nothing out of the ordinary here.
        CONQUEST_BASE            = 7070, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7229, -- You can't fish here.
        DIG_THROW_AWAY           = 7242, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7244, -- You dig and you dig, but find nothing.
        RAYOCHINDOT_DIALOG       = 7409, -- If you are outmatched, run to the city as quickly as you can.
        CROTEILLARD_DIALOG       = 7410, -- Sorry, no chatting while I'm on duty.
        CHEVAL_RIVER_WATER       = 7435, -- You fill your waterskin with water from the river. You now have <item>.
        BLESSED_WATERSKIN        = 7454, -- To get water, trade the waterskin you hold with the river.
        LOGGING_IS_POSSIBLE_HERE = 7485, -- Logging is possible here if you have <item>.
        REGIME_REGISTERED        = 9867, -- New training regime registered!
    },
    mob =
    {
        BIGMOUTH_BILLY_PH =
        {
            [17191194] = 17191196, -- 453.625 -18.436 -127.048
            [17191142] = 17191196, -- 403.967 -36.822 -16.285
            [17191143] = 17191196, -- 413.229 -38.467 7.047
        },
        SWAMFISK_PH       =
        {
            [17191289] = 17191189, -- 461.268 -6.674 -391.342
            [17191290] = 17191189, -- 459.345 -6.686 -363.842
            [17191287] = 17191189, -- 443.334 -17.000 -303.275
            [17191288] = 17191189, -- 423.000 -16.000 -285.000
            [17191188] = 17191189, -- 417.542 -17.210 -177.883
            [17191187] = 17191189, -- 379.120 -27.898 -46.436
            [17191019] = 17191189, -- 373.619 -37.093 8.811
        },
    },
    npc =
    {
        LOGGING =
        {
            17191528,
            17191529,
            17191530,
            17191531,
            17191532,
            17191533,
        },
    },
}

return zones[dsp.zone.EAST_RONFAURE]