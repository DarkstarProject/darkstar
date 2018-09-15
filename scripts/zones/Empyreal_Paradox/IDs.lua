-----------------------------------
-- Area: Empyreal_Paradox
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.EMPYREAL_PARADOX] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7418, -- Tallying conquest results...
        PRISHE_TEXT             = 7683, -- You're about to learn how strong the will to live makes us!
        SELHTEUS_TEXT           = 7696, -- The...Emptiness... Is this...how it was meant...to be...?
        PROMATHIA_TEXT          = 7699, -- Give thyself to the apathy within...
    },
    mob =
    {
        PROMATHIA_OFFSET = 16924673,
    },
    npc =
    {
    },
}

return zones[dsp.zone.EMPYREAL_PARADOX]