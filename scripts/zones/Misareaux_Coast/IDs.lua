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
        ITEM_CANNOT_BE_OBTAINED  = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388, -- Obtained: <item>.
        GIL_OBTAINED             = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET   = 7071, -- You can't fish here.
        CONQUEST_BASE            = 7171, -- Tallying conquest results...
        DOOR_CLOSED              = 7347, -- The door is locked tight.
        LOGGING_IS_POSSIBLE_HERE = 7601, -- Logging is possible here if you have <item>.
        COMMON_SENSE_SURVIVAL    = 8635, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        HOMEPOINT_SET            = 8858, -- Home point set!
    },
    mob =
    {
        OKYUPETE_PH =
        {
            [16879839] = 16879847,
        },
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