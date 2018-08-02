-----------------------------------
-- Area: Open_sea_route_to_Al_Zahbi
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED             = 6387, -- Obtained: <item>
        GIL_OBTAINED              = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED          = 6390, -- Obtained key item: <keyitem>
        FISHING_MESSAGE_OFFSET    = 7048, -- You can't fish here.
        ON_WAY_TO_AL_ZAHBI        = 7307, -- We are on our way to Al Zahbi. We should arrive in
        DOCKING_IN_AL_ZAHBI       = 7308, -- We are now docking in Al Zahbi.
        CEHN_TEYOHNGO_SHOP_DIALOG = 7311, -- If you're looking for fishing gear, you've come to the right place!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI]