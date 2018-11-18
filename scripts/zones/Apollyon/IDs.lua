-----------------------------------
-- Area: Apollyon
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.APOLLYON] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONDITION_FOR_LIMBUS    = 7055, -- You have clearance to enter Limbus, but cannot enter while you or a party member is engaged in battle.
        CHIP_TRADE              = 7361, -- The light in the <item> has grown dim.
        CONQUEST_BASE           = 7366, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.APOLLYON]