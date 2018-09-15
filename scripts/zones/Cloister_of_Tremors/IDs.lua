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
        ITEM_CANNOT_BE_OBTAINED          = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6387, -- Obtained: <item>.
        GIL_OBTAINED                     = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY          = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                    = 7048, -- Tallying conquest results...
        YOU_CANNOT_ENTER_THE_BATTLEFIELD = 7209, -- You cannot enter the battlefield at present. Please wait a little longer.
        PROTOCRYSTAL                     = 7233, -- It is a giant crystal.
        TITAN_UNLOCKED                   = 7567, -- You are now able to summon [Ifrit/Titan/Leviathan/Garuda/Shiva/Ramuh].
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CLOISTER_OF_TREMORS]