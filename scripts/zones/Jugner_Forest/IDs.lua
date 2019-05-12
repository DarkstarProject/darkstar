-----------------------------------
-- Area: Jugner_Forest
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.JUGNER_FOREST] =
{
    text =
    {
        NOTHING_HAPPENS          = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6404, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6410, -- Obtained: <item>.
        GIL_OBTAINED             = 6411, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6413, -- Obtained key item: <keyitem>.
        KEYITEM_LOST             = 6414, -- Lost key item: <keyitem>.
        CONQUEST_BASE            = 7071, -- Tallying conquest results...
        BEASTMEN_BANNER          = 7152, -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET   = 7704, -- You can't fish here.
        DIG_THROW_AWAY           = 7717, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7719, -- You dig and you dig, but find nothing.
        LOGGING_IS_POSSIBLE_HERE = 7897, -- Logging is possible here if you have <item>.
        CONQUEST                 = 8048, -- You've earned conquest points!
        REGIME_REGISTERED        = 10857, -- New training regime registered!
    },
    mob =
    {
        PANZER_PERCIVAL_PH =
        {
            [17203581] = 17203585, -- 535.504 -1.517 152.171 (southeast)
            [17203637] = 17203642, -- 239.541 -0.365 559.722 (northwest)
        },
        SUPPLESPINE_MUJWUJ_PH =
        {
            [17203437] = 17203475,
        },
        KING_ARTHRO = 17203216,
        FRAELISSA   = 17203447,
    },
    npc =
    {
        OVERSEER_BASE = 17203847,
        LOGGING =
        {
            17203863,
            17203864,
            17203865,
            17203866,
            17203867,
            17203868,
        },
    },
}

return zones[dsp.zone.JUGNER_FOREST]