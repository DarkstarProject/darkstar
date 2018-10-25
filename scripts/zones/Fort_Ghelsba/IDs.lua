-----------------------------------
-- Area: Fort_Ghelsba
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.FORT_GHELSBA] =
{
    text =
    {
        CONQUEST_BASE           = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6546, -- Obtained: <item>.
        GIL_OBTAINED            = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6549, -- Obtained key item: <keyitem>.
        CHEST_UNLOCKED          = 7353, -- You unlock the chest!
    },
    mob =
    {
        ORCISH_PANZER = 17354894,
    },
    npc =
    {
        TREASURE_CHEST = 17355012,
    },
}

return zones[dsp.zone.FORT_GHELSBA]