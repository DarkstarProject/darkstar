-----------------------------------
-- Area: Manaclipper
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MANACLIPPER] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7219, -- You can't fish here.
        KHOTS_CHALAHKO_OFFSET   = 7392, -- Ahhh... Isn't it grrreat out here on the open sea!?
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.MANACLIPPER]