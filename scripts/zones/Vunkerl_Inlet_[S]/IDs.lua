-----------------------------------
-- Area: Vunkerl_Inlet_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.VUNKERL_INLET_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET  = 7049, -- You can't fish here.
        COMMON_SENSE_SURVIVAL   = 9018, -- It appears that you have arrived at a new survival guide provided by the Servicemen's Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        BIG_BANG_PH =
        {
            [17117347] = 17117349,
            [17117348] = 17117349,
        },
    },
    npc =
    {
        INDESCRIPT_MARKINGS = 17118008,
    },
}

return zones[dsp.zone.VUNKERL_INLET_S]