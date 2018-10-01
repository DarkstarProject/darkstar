-----------------------------------
-- Area: Jugner_Forest_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.JUGNER_FOREST_S] =
{
    text =
    {
        NOTHING_HAPPENS          = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6387, -- Obtained: <item>.
        GIL_OBTAINED             = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6401, -- There is nothing out of the ordinary here.
        LOGGING_IS_POSSIBLE_HERE = 7068, -- Logging is possible here if you have <item>.
        FISHING_MESSAGE_OFFSET   = 7361, -- You can't fish here.
        ALREADY_OBTAINED_TELE    = 7697, -- You already possess the gate crystal for this telepoint.
    },
    mob =
    {
        FINGERFILCHER_DRADZAD = 17113462,
        COBRACLAW_BUCHZVOTCH  = 17113464,
    },
    npc =
    {
        LOGGING =
        {
            17113901,
            17113902,
            17113903,
            17113904,
            17113905,
            17113906,
        },
    },
}

return zones[dsp.zone.JUGNER_FOREST_S]