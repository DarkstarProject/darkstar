-----------------------------------
-- Area: Cloister_of_Tremors
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CLOISTER_OF_TREMORS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED          = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6388, -- Obtained: <item>.
        GIL_OBTAINED                     = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY          = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                    = 7049, -- Tallying conquest results...
        YOU_CANNOT_ENTER_THE_BATTLEFIELD = 7210, -- You cannot enter the battlefield at present. Please wait a little longer.
        PROTOCRYSTAL                     = 7234, -- It is a giant crystal.
        TITAN_UNLOCKED                   = 7568, -- You are now able to summon [Ifrit/Titan/Leviathan/Garuda/Shiva/Ramuh].
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CLOISTER_OF_TREMORS]