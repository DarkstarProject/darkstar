-----------------------------------
-- Area: Open_sea_route_to_Mhaura
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.OPEN_SEA_ROUTE_TO_MHAURA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET     = 7048, -- You can't fish here.
        ON_WAY_TO_MHAURA           = 7307, -- We are on our way to Mhaura. We should arrive in [less than an hour/about 1 hour/about 2 hours/about 3 hours/about 4 hours/about 5 hours/about 6 hours/about 7 hours] (# [minute/minutes] in Earth time).
        DOCKING_IN_MHAURA          = 7308, -- We are now docking in Mhaura.
        PASHI_MACCALEH_SHOP_DIALOG = 7311, -- Step right up for the best fishing gear in these parts!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.OPEN_SEA_ROUTE_TO_MHAURA]