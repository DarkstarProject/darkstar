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
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7069, -- You can't fish here.
    },
    mob =
    {
        BURLIBIX_BRAWNBACK_PH =
        {
            [17121398] = 17121399,
            [17121402] = 17121399,
        },
        LA_VELUE_PH =
        {
            [17121554] = 17121576, -- -314.365 -18.745 -56.016
        },
        HABERGOASS_PH =
        {
            [17121602] = 17121603,
        },
    },
    npc =
    {
    },
}

return zones[dsp.zone.BATALLIA_DOWNS_S]