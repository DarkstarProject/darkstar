-----------------------------------
-- Area: Buburimu_Peninsula
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BUBURIMU_PENINSULA] =
{
    text =
    {
        NOTHING_HAPPENS                = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED        = 6417, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6423, -- Obtained: <item>.
        GIL_OBTAINED                   = 6424, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6426, -- Obtained key item: <keyitem>.
        KEYITEM_LOST                   = 6427, -- Lost key item: <keyitem>.
        CONQUEST_BASE                  = 7084, -- Tallying conquest results...
        BEASTMEN_BANNER                = 7165, -- There is a beastmen's banner.
        FIVEOFSPADES_DIALOG            = 7243, -- GiMmefIvE! FiVe isA cArdIanOF WiN-DuRst! FIvEiS OnpA-tRol!
        FISHING_MESSAGE_OFFSET         = 7249, -- You can't fish here.
        DIG_THROW_AWAY                 = 7262, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                   = 7264, -- You dig and you dig, but find nothing.
        SONG_RUNES_DEFAULT             = 7369, -- An old momument. A melancholy song of two separated lovers is written upon it.
        SONG_RUNES_REQUIRE             = 7383, -- If only you had <item>, you could jot down the lyrics.
        SONG_RUNES_WRITING             = 7384, -- You write down the lyrics on the <item>.
        SIGN_1                         = 7391, -- West: Tahrongi Canyon Southeast: Mhaura
        SIGN_2                         = 7392, -- West: Tahrongi Canyon South: Mhaura
        SIGN_3                         = 7393, -- West: Tahrongi Canyon Southwest: Mhaura
        SIGN_4                         = 7394, -- West: Mhaura and Tahrongi Canyon
        SIGN_5                         = 7395, -- West: Mhaura Northwest: Tahrongi Canyon
        LOGGING_IS_POSSIBLE_HERE       = 7396, -- Logging is possible here if you have <item>.
        CONQUEST                       = 7412, -- You've earned conquest points!
        YOU_CANNOT_ENTER_DYNAMIS       = 7893, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        MYSTERIOUS_VOICE               = 7894, -- You hear a mysterious, floating voice: The guiding aura has not yet faded... Bring forth the <item>.
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7895, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        REGIME_REGISTERED              = 10291, -- New training regime registered!
    },
    mob =
    {
        BUBURIMBOO_PH =
        {
            [17261000] = 17261003, -- 443.429 19.500 135.322
            [17261002] = 17261003, -- 442.901 19.500 109.075
            [17261001] = 17261003, -- 443.004 19.500 96.000
            [17260999] = 17261003, -- 444.224 19.499 76.000
        },
        HELLDIVER_PH  =
        {
            [17260886] = 17260907, -- 439.685 -0.200 -271.203
            [17260906] = 17260907, -- 509.641 0.151 -267.664
            [17260905] = 17260907, -- 503.268 -0.981 -211.204
            [17260868] = 17260907, -- 395.297 -0.037 -149.776
            [17260887] = 17260907, -- 445.199 -0.323 -306.818
        },
    },
    npc =
    {
        OVERSEER_BASE   = 17261149,
        SIGNPOST_OFFSET = 17261164,
        LOGGING =
        {
            17261174,
            17261175,
            17261176,
            17261177,
            17261178,
            17261179,
        },
    },
}

return zones[dsp.zone.BUBURIMU_PENINSULA]