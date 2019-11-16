-----------------------------------
-- Area: Sacrificial_Chamber
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SACRIFICIAL_CHAMBER] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        DOOR_SHUT               = 7690, -- The door is firmly shut.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.SACRIFICIAL_CHAMBER]