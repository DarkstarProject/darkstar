-----------------------------------
-- Area: Ship_bound_for_Selbina_Pirates
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SHIP_BOUND_FOR_SELBINA_PIRATES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6388, -- Obtained: <item>
        GIL_OBTAINED            = 6389, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>
        FISHING_MESSAGE_OFFSET  = 7230, -- You can't fish here
        ON_WAY_TO_SELBINA       = 7331, -- We're on our way to Selbina.
        RAJMONDA_SHOP_DIALOG    = 7336, -- There's nothing like fishing to pass the time!
        MAERA_SHOP_DIALOG       = 7337, -- May I offer you items to help you on your journey?
        ARRIVING_SOON_SELBINA   = 7338, -- We will be arriving soon
    },
    mob =
    {
        BLACKBEARD = 17707025,
        SHIP_WIGHT = 17707024,
    },
    npc =
    {
    },
}

return zones[dsp.zone.SHIP_BOUND_FOR_SELBINA_PIRATES]