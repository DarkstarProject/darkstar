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
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CHIP_TRADE_T            = 7028, -- What do you wish to do? Show me the cutscene again. Skip the cutscene and continue.
        CONDITION_FOR_LIMBUS_T  = 7055, -- You have clearance to enter Limbus, but cannot enter while you or a party member is engaged in battle.
        TIME_EXTENDED           = 7372, -- Your time in Limbus has been extended...
        CONQUEST_BASE           = 7375, -- Tallying conquest results...
    },
    mob =
    {
        TEMENOS_E_MOB = 
        {
            16928840,
            16928849,
            16928858,
            16928867,
            16928876,
            16928885,
            16928892,
        },
    },
    npc =
    {
        GATE_OFFSET = 16929221,
        COFFER_OFFSET = 16928768,
    },
}

return zones[dsp.zone.TEMENOS]