-----------------------------------
-- Area: Chamber_of_Oracles
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CHAMBER_OF_ORACLES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED          = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6388, -- Obtained: <item>.
        GIL_OBTAINED                     = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                    = 7049, -- Tallying conquest results...
        YOU_CANNOT_ENTER_THE_BATTLEFIELD = 7210, -- You cannot enter the battlefield at present. Please wait a little longer.
        PLACED_INTO_THE_PEDESTAL         = 7617, -- It appears that something should be placed into this pedestal.
        YOU_PLACE_THE                    = 7618, -- You place the <item> into the pedestal.
        IS_SET_IN_THE_PEDESTAL           = 7619, -- The <item> is set in the pedestal.
        HAS_LOST_ITS_POWER               = 7620, -- The <item> has lost its power.
        YOU_DECIDED_TO_SHOW_UP           = 7639, -- So, you decided to show up. Now it's time to see what you're really made of, heh heh heh.
        LOOKS_LIKE_YOU_WERENT_READY      = 7640, -- Looks like you weren't ready for me, were you? Now go home, wash your face, and come back when you think you've got what it takes.
        YOUVE_COME_A_LONG_WAY            = 7641, -- Hm. That was a mighty fine display of skill there, <name>. You've come a long way...
        TEACH_YOU_TO_RESPECT_ELDERS      = 7642, -- I'll teach you to respect your elders!
        TAKE_THAT_YOU_WHIPPERSNAPPER     = 7643, -- Take that, you whippersnapper!
        NOW_THAT_IM_WARMED_UP            = 7644, -- Now that I'm warmed up...
        THAT_LL_HURT_IN_THE_MORNING      = 7645, -- Ungh... That'll hurt in the morning...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CHAMBER_OF_ORACLES]