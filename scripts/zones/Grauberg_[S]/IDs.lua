-----------------------------------
-- Area: Grauberg_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GRAUBERG_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET      = 7048, -- You can't fish here.
        HARVESTING_IS_POSSIBLE_HERE = 7686, -- Harvesting is possible here if you have
        NOTHING_OUT_OF_ORDINARY     = 7766, -- There is nothing out of the ordinary here.
    },
    mob =
    {
        MIGRATORY_HIPPOGRYPH = 17142108,
    },
    npc =
    {
        GRAUBERG_INDESCRIPT_MARKINGS = 17142586,
    },
}

return zones[dsp.zone.GRAUBERG_S]