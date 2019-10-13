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
        PLAYER_OBTAINS_ITEM      = 8644,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8645,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8646,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 8647,  -- You already possess that temporary item.
        NO_COMBINATION           = 8652,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 8653,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8654,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 8655,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 8656,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 8657,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 8658,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 8659,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 8660,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 8661,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 8662,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 8663,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 8664,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 8675,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 8667,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 10857, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 13086  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
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