-----------------------------------
-- Area: Davoi
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DAVOI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6388, -- Obtained: <item>.
        GIL_OBTAINED                = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6391, -- Obtained key item: <keyitem>.
        NOT_ENOUGH_GIL              = 6393, -- You do not have enough gil.
        ITEMS_OBTAINED              = 6397, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY     = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE               = 7049, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET      = 7208, -- You can't fish here.
        CAVE_HAS_BEEN_SEALED_OFF    = 7352, -- The cave has been sealed off by some sort of barrier.
        MAY_BE_SOME_WAY_TO_BREAK    = 7353, -- There may be some way to break through.
        POWER_OF_THE_ORB_ALLOW_PASS = 7355, -- The disruptive power of the orb allows passage through the barrier.
        QUEMARICOND_DIALOG          = 7374, -- I can't believe I've lost my way! They must have used an Orcish spell to change the terrain! Yes, that must be it!
        YOU_SEE_NOTHING             = 7408, -- There is nothing here.
        AN_ORCISH_STORAGE_HOLE      = 7450, -- An Orcish storage hole. There is something inside, but you cannot open it without a key.
        A_WELL                      = 7452, -- A well, presumably dug by Orcs.
        CHEST_UNLOCKED              = 7471, -- You unlock the chest!
    },
    mob =
    {
        HAWKEYED_DNATBAT_PH =
        {
            [17387558] = 17387567, -- 337.116 -1.167 -110.483
            [17387560] = 17387567, -- 336.498 -0.563 -138.502
            [17387563] = 17387567, -- 371.525 0.235 -176.188
        },
        STEELBITER_GUDRUD_PH =
        {
            [17387578] = 17387585, -- 252.457 3.501 -248.655
        },
        TIGERBANE_BAKDAK_PH =
        {
            [17387602] = 17387606, -- 158 -0.662 -18
            [17387603] = 17387606, -- 153.880 -0.769 -18.092
        },
        POISONHAND_GNADGAD_PH =
        {
            [17387634] = 17387644, -- -53.910 -0.583 56.606
            [17387635] = 17387644, -- -62.647 -0.468 24.442
            [17387636] = 17387644, -- -64.578 -0.658 61.273
            [17387637] = 17387644, -- -59.013 -0.590 14.783
            [17387638] = 17387644, -- -50.158 -0.537 22.257
            [17387639] = 17387644, -- -56.626 -0.607 63.285
            [17387640] = 17387644, -- -54.694 -0.545 42.385
            [17387641] = 17387644, -- -60.057 -0.655 29.127
        },
        BLUBBERY_BULGE_PH   =
        {
            [17387919] = 17387920, -- -225.237 2.295 -294.764
        },
        GAVOTVUT            = 17387965,
        BARAKBOK            = 17387966,
        BILOPDOP            = 17387967,
        DELOKNOK            = 17387968,
        PURPLEFLASH_BRUKDOK = 17387969,
        ONE_EYED_GWAJBOJ    = 17387970,
        THREE_EYED_PROZPUZ  = 17387971,
    },
    npc =
    {
        HIDE_FLAP_OFFSET = 17388023,
        STORAGE_HOLE     = 17388025,
        TREASURE_CHEST   = 17388027,
    },
}

return zones[dsp.zone.DAVOI]