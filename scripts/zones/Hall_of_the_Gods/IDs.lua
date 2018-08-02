-----------------------------------
-- Area: Hall_of_the_Gods
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.HALL_OF_THE_GODS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7192, -- Tallying conquest results...
        NOTHING_OUT_OF_ORDINARY = 7354, -- There is nothing out of the ordinary here.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.HALL_OF_THE_GODS]