-----------------------------------
-- Area: La_Vaule_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.LA_VAULE_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7049, -- You can't fish here.
    },
    mob =
    {
        HAWKEYED_DNATBAT_PH =
        {
            [17125431] = 17125433, -- 375.737 0.272 -174.487
        },
        ASHMAKER_GOTBLUT_PH =
        {
            [17125450] = 17125452, -- 234.481 3.424 -241.751
        },
    },
    npc =
    {
    },
}

return zones[dsp.zone.LA_VAULE_S]