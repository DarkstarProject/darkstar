-----------------------------------
-- Area: Pashhow_Marshlands
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PASHHOW_MARSHLANDS] =
{
    text =
    {
        NOTHING_HAPPENS          = 141,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6404,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6410,  -- Obtained: <item>.
        GIL_OBTAINED             = 6411,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6413,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST             = 6414,  -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6424,  -- There is nothing out of the ordinary here.
        CONQUEST_BASE            = 7071,  -- Tallying conquest results...
        BEASTMEN_BANNER          = 7152,  -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET   = 7230,  -- You can't fish here.
        DIG_THROW_AWAY           = 7243,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7245,  -- You dig and you dig, but find nothing.
        PLAYER_OBTAINS_ITEM      = 8462,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8463,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8464,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 8465,  -- You already possess that temporary item.
        NO_COMBINATION           = 8470,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 8471,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8472,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 8473,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 8474,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 8475,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 8476,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 8477,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 8478,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 8479,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 8480,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 8481,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 8482,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 8483,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 8485,  -- The monster was concealing a treasure chest!
        CONQUEST                 = 7919,  -- You've earned conquest points!
        REGIME_REGISTERED        = 10711, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 12822  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        NI_ZHO_BLADEBENDER_PH =
        {
            [17223740] = 17223797, -- -429.953 24.5 -305.450
            [17223789] = 17223797, -- 11.309 23.904 -337.923
        },
        JOLLY_GREEN_PH        =
        {
            [17223888] = 17223889, -- 184.993 24.499 -41.790
        },
        BLOODPOOL_VORAX_PH    =
        {
            [17224014] = 17224019, -- -351.884 24.014 513.531
        },
        BOWHO_WARMONGER       = 17224104,
    },
    npc =
    {
        CASKET_BASE   = 17224274,
        OVERSEER_BASE = 17224325,
    },
}

return zones[dsp.zone.PASHHOW_MARSHLANDS]