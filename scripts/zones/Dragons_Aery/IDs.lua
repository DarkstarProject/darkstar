-----------------------------------
-- Area: Dragons_Aery
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DRAGONS_AERY] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6396, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET     = 7048, -- You can't fish here.
        CONQUEST_BASE              = 7150, -- Tallying conquest results...
    },
    mob =
    {
        FAFNIR  = 17408018,
        NIDHOGG = 17408019,
    },
    npc =
    {
        FAFNIR_QM = 17408033,
    },
}

return zones[dsp.zone.DRAGONS_AERY]