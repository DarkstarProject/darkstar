-----------------------------------
-- Area: Temenos
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.TEMENOS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CHIP_TRADE_T            = 7027, -- What do you wish to do? Show me the cutscene again. Skip the cutscene and continue.
        CONDITION_FOR_LIMBUS_T  = 7054, -- You have clearance to enter Limbus, but cannot enter while you or a party member is engaged in battle.
        CONQUEST_BASE           = 7374, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.TEMENOS]