-----------------------------------
-- Area: Beaucedine_Glacier_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BEAUCEDINE_GLACIER_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
    },
    mob =
    {
        GRANDGOULE_PH =
        {
            [17334475] = 17334482,
            [17334476] = 17334482,
            [17334477] = 17334482,
        },
    },
    npc =
    {
    },
}

return zones[dsp.zone.BEAUCEDINE_GLACIER_S]