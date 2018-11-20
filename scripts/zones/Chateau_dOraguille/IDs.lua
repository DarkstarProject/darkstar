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
        ITEM_CANNOT_BE_OBTAINED = 6590, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6596, -- Obtained: <item>.
        GIL_OBTAINED            = 6597, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6599, -- Obtained key item: <keyitem>.
        KEYITEM_LOST            = 6600, -- Lost key item: <keyitem>.
        HALVER_OFFSET           = 6793, -- The princess is always speaking of your deeds for the Kingdom. Everyone here is counting on you, <name>.
        CONQUEST_BASE           = 6879, -- Tallying conquest results...
        TOMBSTONE               = 7172, -- Here lies the beloved Queen Leaute. May Her Majesty's soul find Paradise.
        SAVAGE_BLADE_LEARNED    = 7940, -- You have learned the weapon skill Savage Blade!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CHATEAU_DORAGUILLE]