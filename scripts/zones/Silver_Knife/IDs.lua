-----------------------------------
-- Area: Silver_Knife
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SILVER_KNIFE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6376, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6379, -- Obtained: <item>.
        GIL_OBTAINED            = 6380, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6382, -- Obtained key item: <keyitem>.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.SILVER_KNIFE]