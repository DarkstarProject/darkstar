-----------------------------------
-- Area: Abyssea-Empyreal_Paradox
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ABYSSEA_EMPYREAL_PARADOX] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CRUOR_TOTAL             = 6985, -- Obtained <number> cruor. (Total: <number>)
        CRUOR_OBTAINED          = 7394, -- <name> obtained <number> cruor.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.ABYSSEA_EMPYREAL_PARADOX]