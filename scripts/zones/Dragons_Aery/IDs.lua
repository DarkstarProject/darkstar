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
        ITEM_CANNOT_BE_OBTAINED    = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388, -- Obtained: <item>.
        GIL_OBTAINED               = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6397, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6402, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET     = 7049, -- You can't fish here.
        CONQUEST_BASE              = 7151, -- Tallying conquest results...
        COMMON_SENSE_SURVIVAL      = 7495, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
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