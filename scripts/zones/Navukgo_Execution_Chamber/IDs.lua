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
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        KARABABA_ENOUGH         = 7628, -- That's quite enough...
        KARABABA_ROUGH          = 7629, -- Time for me to start playing rough!
        KARABARA_FIRE           = 7630, -- Fuel for the fire! It doesn't pay to invoke my ire!
        KARABARA_ICE            = 7631, -- Well, if you won't play nice, I'll put your sorry hide on ice!
        KARABARA_WIND           = 7632, -- This battle is growing stale. How about we have a refreshing gale!
        KARABARA_EARTH          = 7633, -- Sometimes it comes as quite a shock, how much damage you can deal with simple rock!
        KARABARA_LIGHTNING      = 7634, -- How I love to rip things asunder! Witness the power of lightning and thunder!
        KARABARA_WATER          = 7635, -- Water is more dangerous than most expect. Never fear, I'll teach you respect!
        KARABABA_QUIT           = 7643, -- What a completely useless shield. It's time for me to quit the field.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.NAVUKGO_EXECUTION_CHAMBER]