-----------------------------------
-- Area: Residential_Area
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.RESIDENTIAL_AREA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 0, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 0, -- Obtained: <item>.
        GIL_OBTAINED            = 0, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 0, -- Obtained key item: <keyitem>.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.RESIDENTIAL_AREA]