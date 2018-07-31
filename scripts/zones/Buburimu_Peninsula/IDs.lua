-----------------------------------
-- Area: Buburimu_Peninsula
-----------------------------------
require("scripts/globals/zones")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BUBURIMU_PENINSULA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED        = 6416, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6422, -- Obtained: <item>.
        GIL_OBTAINED                   = 6423, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6425, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                  = 7083, -- Tallying conquest results...
        BEASTMEN_BANNER                = 7164, -- There is a beastmen's banner.
        FIVEOFSPADES_DIALOG            = 7242, -- GiMme★fIvE! FiVe is★A cArdIan★OF WiN-DuRst! FIvE★iS On★pA-tRol!≺Prompt≻
        FISHING_MESSAGE_OFFSET         = 7248, -- You can't fish here.
        DIG_THROW_AWAY                 = 7261, -- You dig up$, but your inventory is full. You regretfully throw the # away.
        FIND_NOTHING                   = 7263, -- You dig and you dig, but find nothing.
        SONG_RUNES_DEFAULT             = 7368, -- An old momument. A melancholy song of two separated lovers is written upon it.
        SONG_RUNES_REQUIRE             = 7382, -- If only you had ≺Possible Special Code: 01≻≺Possible Special Code: 01≻≺Possible Special Code: 01≻ ≺Possible Special Code: 01≻≺Possible Special Code: 05≻$≺BAD CHAR: 8280≻≺BAD CHAR: 80≻≺BAD CHAR: 80≻, you could jot down the lyrics.≺Prompt≻
        SONG_RUNES_WRITING             = 7383, -- You write down the lyrics on the ≺Possible Special Code: 01≻≺Possible Special Code: 05≻#≺BAD CHAR: 8280≻≺BAD CHAR: 80≻≺BAD CHAR: 80≻.≺Prompt≻
        SIGN_1                         = 7390, -- West: Tahrongi Canyon Southeast: Mhaura
        SIGN_2                         = 7391, -- West: Tahrongi Canyon South: Mhaura
        SIGN_3                         = 7392, -- West: Tahrongi Canyon Southwest: Mhaura
        SIGN_4                         = 7393, -- West: Mhaura and Tahrongi Canyon
        SIGN_5                         = 7394, -- West: Mhaura Northwest: Tahrongi Canyon
        LOGGING_IS_POSSIBLE_HERE       = 7395, -- Logging is possible here if you have
        CONQUEST                       = 7411, -- You've earned conquest points!
        YOU_CANNOT_ENTER_DYNAMIS       = 7890, -- You cannot enter Dynamis
        MYSTERIOUS_VOICE               = 7891, -- You hear a mysterious, floating voice: The guiding aura has not yet faded... Bring forth the
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7892, -- Players who have not reached levelare prohibited from entering Dynamis.
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
        OVERSEER_BASE_6          = 17261148,
        BUBURIMU_SIGNPOST_OFFSET = 17261163,
    },
}

return zones[dsp.zone.BUBURIMU_PENINSULA]