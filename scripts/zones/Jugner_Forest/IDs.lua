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
        NOTHING_HAPPENS          = 141,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6404,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6410,  -- Obtained: <item>.
        GIL_OBTAINED             = 6411,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6413,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST             = 6414,  -- Lost key item: <keyitem>.
        CONQUEST_BASE            = 7071,  -- Tallying conquest results...
        BEASTMEN_BANNER          = 7152,  -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET   = 7704,  -- You can't fish here.
        DIG_THROW_AWAY           = 7717,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7719,  -- You dig and you dig, but find nothing.
        LOGGING_IS_POSSIBLE_HERE = 7897,  -- Logging is possible here if you have <item>.
        CONQUEST                 = 8048,  -- You've earned conquest points!
        PLAYER_OBTAINS_ITEM      = 8644,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8645,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8646,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP     = 8647,  -- You already possess that temporary item.
        NO_COMBINATION           = 8652,  -- You were unable to enter a combination.
        REGIME_REGISTERED        = 10857, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 13086, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
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
        FRADUBIO_PH =
        {
            [17203447] = 17203448,
        },
        KING_ARTHRO = 17203216,
        FRAELISSA   = 17203447,
    },
    npc =
    {
        CASKET_BASE   = 17203785,
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