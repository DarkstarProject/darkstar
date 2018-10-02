-----------------------------------
-- Area: Chateau_dOraguille
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CHATEAU_DORAGUILLE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6589, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6595, -- Obtained: <item>.
        GIL_OBTAINED            = 6596, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6598, -- Obtained key item: <keyitem>.
        KEYITEM_LOST            = 6599, -- Lost key item: <keyitem>.
        HALVER_OFFSET           = 6792, -- The princess is always speaking of your deeds for the Kingdom. Everyone here is counting on you, <name>.
        CONQUEST_BASE           = 6878, -- Tallying conquest results...
        TOMBSTONE               = 7171, -- Here lies the beloved Queen Leaute. May Her Majesty's soul find Paradise.
        SAVAGE_BLADE_LEARNED    = 7939, -- You have learned the weapon skill Savage Blade!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CHATEAU_DORAGUILLE]