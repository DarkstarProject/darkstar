-----------------------------------
-- Area: Spire_of_Dem
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SPIRE_OF_DEM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        FAINT_SCRAPING          = 7080, -- You can hear a faint scraping sound from within, but the way is barred by some strange membrane...
        CANT_REMEMBER           = 7631, -- You cannot remember when exactly, but you have obtained
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.SPIRE_OF_DEM]