-----------------------------------
-- Area: Ship_bound_for_Selbina
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SHIP_BOUND_FOR_SELBINA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        FISHING_MESSAGE_OFFSET  = 7229, -- You can't fish here
        ON_WAY_TO_SELBINA       = 7330, -- We're on our way to Selbina.
        RAJMONDA_SHOP_DIALOG    = 7335, -- There's nothing like fishing to pass the time!
        MAERA_SHOP_DIALOG       = 7336, -- May I offer you items to help you on your journey?
        ARRIVING_SOON_SELBINA   = 7337, -- We will be arriving soon
    },
    mob =
    {
        ENAGAKURE = 17678351,
    },
    npc =
    {
    },
}

return zones[dsp.zone.SHIP_BOUND_FOR_SELBINA]