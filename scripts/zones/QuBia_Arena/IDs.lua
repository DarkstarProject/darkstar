-----------------------------------
-- Area: QuBia_Arena
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.QUBIA_ARENA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED      = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388, -- Obtained: <item>.
        GIL_OBTAINED                 = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                = 7049, -- Tallying conquest results...
        FLAT_PREPARE                 = 7622, -- I am Trion, of San d'Oria!
        FLAT_LAND                    = 7623, -- Feel the fire of my forefathers!
        RLB_PREPARE                  = 7624, -- The darkness before me that shrouds the light of good...
        RLB_LAND                     = 7625, -- ...Return to the hell you crawled out from!
        SAVAGE_PREPARE               = 7626, -- The anger, the pain, and the will to survive... Let the spirit of San d'Oria converge within this blade.
        SAVAGE_LAND                  = 7627, -- And with this blade I will return the glory to my kingdom's people!
        YOU_DECIDED_TO_SHOW_UP       = 7628, -- So, you decided to show up. Now it's time to see what you're really made of, heh heh heh.
        LOOKS_LIKE_YOU_WERENT_READY  = 7629, -- Looks like you weren't ready for me, were you? Now go home, wash your face, and come back when you think you've got what it takes.
        YOUVE_COME_A_LONG_WAY        = 7630, -- Hm. That was a mighty fine display of skill there, <name>. You've come a long way...
        TEACH_YOU_TO_RESPECT_ELDERS  = 7631, -- I'll teach you to respect your elders!
        TAKE_THAT_YOU_WHIPPERSNAPPER = 7632, -- Take that, you whippersnapper!
        NOW_THAT_IM_WARMED_UP        = 7633, -- Now that I'm warmed up...
        THAT_LL_HURT_IN_THE_MORNING  = 7634, -- Ungh... That'll hurt in the morning...
    },
    mob =
    {
        HEIR_TO_THE_LIGHT_OFFSET   = 17621014,
    },
    npc =
    {
    },
}

return zones[dsp.zone.QUBIA_ARENA]