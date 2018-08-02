-----------------------------------
-- Area: Meriphataud_Mountains_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MERIPHATAUD_MOUNTAINS_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        ALREADY_OBTAINED_TELE   = 7590, -- You already possess the gate crystal for this telepoint.
        NOTHING_OUT_OF_ORDINARY = 7835, -- There is nothing out of the ordinary here.
    },
    mob =
    {
        BLOODLAPPER = 17174889,
    },
    npc =
    {
        MERIPH_S_MARKINGS = 17175342,
    },
}

return zones[dsp.zone.MERIPHATAUD_MOUNTAINS_S]