-----------------------------------
-- Area: Mordion_Gaol
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MORDION_GAOL] =
{
    text =
    {
        CONQUEST_BASE           = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6541, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6547, -- Obtained: <item>.
        GIL_OBTAINED            = 6548, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6550, -- Obtained key item: <keyitem>.
        NO_ESCAPE               = 7208, -- Any attempt at escape is futile!
        PROHIBITED_ACTIVITIES   = 7224, -- Your character has been jailed due to prohibited activities. Your account will soon be suspended due to this violation.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.MORDION_GAOL]