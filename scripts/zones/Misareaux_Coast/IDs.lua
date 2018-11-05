-----------------------------------
-- Area: Misareaux_Coast
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MISAREAUX_COAST] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6387, -- Obtained: <item>.
        GIL_OBTAINED             = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET   = 7070, -- You can't fish here.
        CONQUEST_BASE            = 7170, -- Tallying conquest results...
        DOOR_CLOSED              = 7346, -- The door is locked tight.
        LOGGING_IS_POSSIBLE_HERE = 7600, -- Logging is possible here if you have <item>.
        HOMEPOINT_SET            = 8857, -- Home point set!
    },
    mob =
    {
        PM6_2_MOB_OFFSET = 16879893,
        BOGGELMANN       = 16879897,
        GRATION          = 16879899,
    },
    npc =
    {
        LOGGING =
        {
            16879972,
            16879973,
            16879974,
            16879975,
            16879976,
            16879977,
        },
    },
}

return zones[dsp.zone.MISAREAUX_COAST]