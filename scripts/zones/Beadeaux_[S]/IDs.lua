-----------------------------------
-- Area: Beadeaux_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BEADEAUX_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
    },
    mob =
    {
        DA_DHA_HUNDREDMASK_PH = 
        {
            [17154095] = 17154195, -- -37.741 0.344 -127.037
        },
    },
    npc =
    {
    },
}

return zones[dsp.zone.BEADEAUX_S]