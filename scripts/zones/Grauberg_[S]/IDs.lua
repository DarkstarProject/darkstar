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
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET      = 7048, -- You can't fish here.
        HARVESTING_IS_POSSIBLE_HERE = 7686, -- Harvesting is possible here if you have <item>.
    },
    mob =
    {
        MIGRATORY_HIPPOGRYPH = 17142108,
    },
    npc =
    {
        HARVESTING =
        {
            17142545,
            17142546,
            17142547,
            17142548,
            17142549,
            17142550,
        },
        GRAUBERG_INDESCRIPT_MARKINGS = 17142586,
    },
}

return zones[dsp.zone.GRAUBERG_S]