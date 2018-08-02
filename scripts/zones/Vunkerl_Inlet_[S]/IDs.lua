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
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        FISHING_MESSAGE_OFFSET  = 7048, -- You can't fish here
        NOTHING_OUT_OF_ORDINARY = 7692, -- There is nothing out of the ordinary here
    },
    mob =
    {
    },
    npc =
    {
        VUNKERL_INDESCRIPT_MARKINGS = 17118008,
    },
}

return zones[dsp.zone.VUNKERL_INLET_S]