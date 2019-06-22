-----------------------------------
-- Area: The_Shrouded_Maw
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_SHROUDED_MAW] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7420, -- Tallying conquest results...
    },
    mob =
    {
        DIABOLOS_OFFSET = 16818177,
    },
    npc =
    {
        DARKNESS_NAMED_TILE_OFFSET = 16818259,
    },
}

return zones[dsp.zone.THE_SHROUDED_MAW]