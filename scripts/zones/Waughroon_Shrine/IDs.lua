-----------------------------------
-- Area: Waughroon_Shrine
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.WAUGHROON_SHRINE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED      = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388, -- Obtained: <item>.
        GIL_OBTAINED                 = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                = 7049, -- Tallying conquest results...
        YOU_DECIDED_TO_SHOW_UP       = 7676, -- So, you decided to show up. Now it's time to see what you're really made of, heh heh heh.
        LOOKS_LIKE_YOU_WERENT_READY  = 7677, -- Looks like you weren't ready for me, were you? Now go home, wash your face, and come back when you think you've got what it takes.
        YOUVE_COME_A_LONG_WAY        = 7678, -- Hm. That was a mighty fine display of skill there, <name>. You've come a long way...
        TEACH_YOU_TO_RESPECT_ELDERS  = 7679, -- I'll teach you to respect your elders!
        TAKE_THAT_YOU_WHIPPERSNAPPER = 7680, -- Take that, you whippersnapper!
        NOW_THAT_IM_WARMED_UP        = 7681, -- Now that I'm warmed up...
        THAT_LL_HURT_IN_THE_MORNING  = 7682, -- Ungh... That'll hurt in the morning...
        ONE_TENTACLE_WOUNDED         = 7700, -- One of the sea creature's tentacles have been wounded.
        ALL_TENTACLES_WOUNDED        = 7701, -- All of the sea creature's tentacles have been wounded.
    },
    mob =
    {
        HEAVY_METAL_CRAB_OFFSET = 17367086,
        MACHA_OFFSET            = 17367098,
        METSANNEITSYT_OFFSET    = 17367110,
        FLAYER_FRANZ_OFFSET     = 17367122,
        PLATOON_SCORPION_OFFSET = 17367266,
    },
    npc =
    {
    },
}

return zones[dsp.zone.WAUGHROON_SHRINE]