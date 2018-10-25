-----------------------------------
-- Area: Navukgo_Execution_Chamber
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.NAVUKGO_EXECUTION_CHAMBER] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        KARABABA_ENOUGH         = 7627, -- That's quite enough...
        KARABABA_ROUGH          = 7628, -- Time for me to start playing rough!
        KARABARA_FIRE           = 7629, -- Fuel for the fire! It doesn't pay to invoke my ire!
        KARABARA_ICE            = 7630, -- Well, if you won't play nice, I'll put your sorry hide on ice!
        KARABARA_WIND           = 7631, -- This battle is growing stale. How about we have a refreshing gale!
        KARABARA_EARTH          = 7632, -- Sometimes it comes as quite a shock, how much damage you can deal with simple rock!
        KARABARA_LIGHTNING      = 7633, -- How I love to rip things asunder! Witness the power of lightning and thunder!
        KARABARA_WATER          = 7634, -- Water is more dangerous than most expect. Never fear, I'll teach you respect!
        KARABABA_QUIT           = 7642, -- What a completely useless shield. It's time for me to quit the field.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.NAVUKGO_EXECUTION_CHAMBER]