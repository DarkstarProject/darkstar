-----------------------------------
-- Area: East_Ronfaure_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.EAST_RONFAURE_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388, -- Obtained: <item>.
        GIL_OBTAINED             = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402, -- There is nothing out of the ordinary here.
        LOGGING_IS_POSSIBLE_HERE = 7146, -- Logging is possible here if you have <item>.
        FISHING_MESSAGE_OFFSET   = 7730, -- You can't fish here.
    },
    mob =
    {
        GOBLINTRAP_PH =
        {
            [17109295] = 17109296, -- 156 0 -438
        },
        SKOGS_FRU_PH =
        {
            [17109268] = 17109338,
            [17109306] = 17109338,
            [17109307] = 17109338,
            [17109308] = 17109338,
        },
        MYRADROSH    = 17109235,
    },
    npc =
    {
        LOGGING =
        {
            17109782,
            17109783,
            17109784,
            17109785,
            17109786,
            17109787,
        },
    },
}

return zones[dsp.zone.EAST_RONFAURE_S]