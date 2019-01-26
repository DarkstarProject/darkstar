-----------------------------------
-- Area: Boneyard_Gully
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BONEYARD_GULLY] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7420, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.BONEYARD_GULLY]