-----------------------------------
-- Area: Silver_Sea_route_to_Nashmau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SILVER_SEA_ROUTE_TO_NASHMAU] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7048, -- You can't fish here.
        JIDWAHN_SHOP_DIALOG     = 7311, -- Would you care for some items to use on your travels?
        ON_WAY_TO_NASHMAU       = 7312, -- We are on our way to Nashmau. We will be arriving soon.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.SILVER_SEA_ROUTE_TO_NASHMAU]