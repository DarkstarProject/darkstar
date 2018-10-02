-----------------------------------
-- Area: Batallia_Downs_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BATALLIA_DOWNS_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7068, -- You can't fish here.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.BATALLIA_DOWNS_S]