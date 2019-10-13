-----------------------------------
-- Area: East_Ronfaure
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.EAST_RONFAURE] =
{
    text =
    {
        NOTHING_HAPPENS          = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6404, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6410, -- Obtained: <item>.
        GIL_OBTAINED             = 6411, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6413, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6424, -- There is nothing out of the ordinary here.
        CONQUEST_BASE            = 7071, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7230, -- You can't fish here.
        DIG_THROW_AWAY           = 7243, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7245, -- You dig and you dig, but find nothing.
        RAYOCHINDOT_DIALOG       = 7410, -- If you are outmatched, run to the city as quickly as you can.
        CROTEILLARD_DIALOG       = 7411, -- Sorry, no chatting while I'm on duty.
        CHEVAL_RIVER_WATER       = 7436, -- You fill your waterskin with water from the river. You now have <item>.
        BLESSED_WATERSKIN        = 7455, -- To get water, trade the waterskin you hold with the river.
        LOGGING_IS_POSSIBLE_HERE = 7486, -- Logging is possible here if you have <item>.
        PLAYER_OBTAINS_ITEM      = 7497, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7498, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7499, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7500, -- You already possess that temporary item.
        NO_COMBINATION           = 7505, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7506, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7507, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7508, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7509, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7510, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7511, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7512, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7513, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7514, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7515, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7516, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7517, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7518, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7520, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9870, -- New training regime registered!
    },
    mob =
    {
        BIGMOUTH_BILLY_PH =
        {
            [17191194] = 17191196, -- 453.625 -18.436 -127.048
            [17191142] = 17191196, -- 403.967 -36.822 -16.285
            [17191143] = 17191196, -- 413.229 -38.467 7.047
        },
        SWAMFISK_PH       =
        {
            [17191289] = 17191189, -- 461.268 -6.674 -391.342
            [17191290] = 17191189, -- 459.345 -6.686 -363.842
            [17191287] = 17191189, -- 443.334 -17.000 -303.275
            [17191288] = 17191189, -- 423.000 -16.000 -285.000
            [17191188] = 17191189, -- 417.542 -17.210 -177.883
            [17191187] = 17191189, -- 379.120 -27.898 -46.436
            [17191019] = 17191189, -- 373.619 -37.093 8.811
        },
    },
    npc =
    {
        CASKET_BASE = 17187499,
        LOGGING =
        {
            17191529,
            17191530,
            17191531,
            17191532,
            17191533,
            17191534,
        },
    },
}

return zones[dsp.zone.EAST_RONFAURE]