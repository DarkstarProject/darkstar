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
        NOTHING_HAPPENS          = 119, -- Nothing happens.
        ITEM_CANNOT_BE_OBTAINED  = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6387, -- Obtained: <item>.
        GIL_OBTAINED             = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6390, -- Obtained key item: <keyitem>.
        LOGGING_IS_POSSIBLE_HERE = 7068, -- Logging is possible here if you have
        FISHING_MESSAGE_OFFSET   = 7361, -- You can't fish here.
        ALREADY_OBTAINED_TELE    = 7697, -- You already possess the gate crystal for this telepoint.
        NOTHING_OUT_OF_ORDINARY  = 7748, -- There is nothing out of the ordinary here.
    },
    mob =
    {
        FINGERFILCHER_DRADZAD = 17113462,
        COBRACLAW_BUCHZVOTCH  = 17113464,
    },
    npc =
    {
    },
}

return zones[dsp.zone.JUGNER_FOREST_S]