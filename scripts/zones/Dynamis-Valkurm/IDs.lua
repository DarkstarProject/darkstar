-----------------------------------
-- Area: Dynamis-Valkurm
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_VALKURM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7149, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.DYNAMIS_VALKURM]