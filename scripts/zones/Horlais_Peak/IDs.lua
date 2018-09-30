-----------------------------------
-- Area: Horlais_Peak
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.HORLAIS_PEAK] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED      = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE   = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                = 6387, -- Obtained: <item>.
        GIL_OBTAINED                 = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6390, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED               = 6396, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY      = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                = 7048, -- Tallying conquest results...
        YOU_DECIDED_TO_SHOW_UP       = 7740, -- So, you decided to show up. Now it's time to see what you're really made of, heh heh heh.
        LOOKS_LIKE_YOU_WERENT_READY  = 7741, -- Looks like you weren't ready for me, were you? Now go home, wash your face, and come back when you think you've got what it takes.
        YOUVE_COME_A_LONG_WAY        = 7742, -- Hm. That was a mighty fine display of skill there, <name>. You've come a long way...
        TEACH_YOU_TO_RESPECT_ELDERS  = 7743, -- I'll teach you to respect your elders!
        TAKE_THAT_YOU_WHIPPERSNAPPER = 7744, -- Take that, you whippersnapper!
        NOW_THAT_IM_WARMED_UP        = 7745, -- Now that I'm warmed up...
        THAT_LL_HURT_IN_THE_MORNING  = 7746, -- Ungh... That'll hurt in the morning...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.HORLAIS_PEAK]