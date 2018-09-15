-----------------------------------
-- Area: Giddeus
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GIDDEUS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6401, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING         = 6402, -- You are suddenly overcome with a sense of foreboding...
        CONQUEST_BASE               = 7048, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET      = 7207, -- You can't fish here.
        SPRING_FILL_UP              = 7353, -- You fill your flask with water.
        SPRING_DEFAULT              = 7354, -- Sparkling clear water bubbles up from the ground. If you have a container, you can fill it here.
        CHEST_UNLOCKED              = 7386, -- You unlock the chest!
        CHEST_FAIL                  = 7387, -- <name> fails to open the chest.
        CHEST_TRAP                  = 7388, -- The chest was trapped!
        CHEST_WEAK                  = 7389, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC                 = 7390, -- The chest was a mimic!
        CHEST_MOOGLE                = 7391, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION              = 7392, -- The chest was but an illusion...
        CHEST_LOCKED                = 7393, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
        HARVESTING_IS_POSSIBLE_HERE = 7394, -- Harvesting is possible here if you have <item>.
        HOMEPOINT_SET               = 7422, -- Home point set!
    },
    mob =
    {
        HOO_MJUU_THE_TORRENT_PH   = 
        {
            [17371490] = 17371515, -- -63.000 -0.860 -91.000
            [17371498] = 17371515, -- -32.000 0.740 -105.000
            [17371486] = 17371515, -- -37.100 0.582 -127.259
            [17371504] = 17371515, -- -42.389 0.315 -130.930
            [17371508] = 17371515, -- -57.000 -2.000 -119.000
            [17371513] = 17371515, -- -39.073 0.597 -115.279
        },
        JUU_DUZU_THE_WHIRLWIND_PH = 
        {
            [17371298] = 17371300, -- 116.667 -3.442 -261.079
            [17371533] = 17371300, -- 85.728 -0.071 -248.141
            [17371291] = 17371300, -- 99.902 -2.725 -213.337
            [17371525] = 17371300, -- 81.263 0.498 -208.812
            [17371529] = 17371300, -- 72.302 0.642 -202.985
            [17371519] = 17371300, -- 20.353 -3.647 -169.309
        },
        VUU_PUQU_THE_BEGUILER_PH  = 
        {
            [17371577] = 17371578, -- -23.973 0.459 -399.155
        },
        VAA_HUJA_THE_ERUDITE      = 17371579,
    },
    npc =
    {
        GIDDEUS_TREASURE_CHEST = 17371608,
    },
}

return zones[dsp.zone.GIDDEUS]