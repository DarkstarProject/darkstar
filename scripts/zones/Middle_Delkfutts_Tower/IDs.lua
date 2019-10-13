-----------------------------------
-- Area: Middle_Delkfutts_Tower
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MIDDLE_DELKFUTTS_TOWER] =
{
    text =
    {
        CONQUEST_BASE            = 4,    -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED  = 6545, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6551, -- Obtained: <item>.
        GIL_OBTAINED             = 6552, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6554, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6565, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING      = 6566, -- You are suddenly overcome with a sense of foreboding...
        FISHING_MESSAGE_OFFSET   = 7212, -- You can't fish here.
        CHEST_UNLOCKED           = 7320, -- You unlock the chest!
        PLAYER_OBTAINS_ITEM      = 7368, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7369, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7370, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7371, -- You already possess that temporary item.
        NO_COMBINATION           = 7376, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7377, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7378, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7379, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7380, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7381, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7382, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7383, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7384, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7385, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7386, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7387, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7388, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7389, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7391, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9454, -- New training regime registered!
    },
    mob =
    {
        EURYTOS_PH               =
        {
            [17420316] = 17420324, -- 27 -47 101
            [17420321] = 17420324, -- 11 -47 99
        },
        POLYBOTES_PH             =
        {
            [17420378] = 17420382, -- -59.370 -64.105 17.313
            [17420381] = 17420382, -- -48.936 -64.114 8.575
            [17420383] = 17420382, -- -42.392 -63.535 -0.946
            [17420384] = 17420382, -- -31,-63.713 -3
        },
        RHOITOS_PH               =
        {
            [17420412] = 17420417, -- 70 -80.094 80
            [17420418] = 17420417, -- 81.445 -79.977 71.427
            [17420419] = 17420417, -- 77.924 -80.084 70.787
            [17420420] = 17420417, -- 75 -79.823 89
        },
        OPHION_PH                =
        {
            [17420513] = 17420529, -- -453 -95.529 -1
            [17420518] = 17420592, -- -409.937 -95.772 48.785
            [17420527] = 17420592, -- -384 -95.529 14
        },
        RHOIKOS_PH               =
        {
            [17420554] = 17420555, -- -402 -111.924 46
            [17420566] = 17420555, -- -389.084 -111.532 35.374
        },
        OGYGOS_PH                =
        {
            [17420593] = 17420592, -- -503 -127.715 24
        },
        BLADE_OF_EVIL_MOB_OFFSET = 17420629,
    },
    npc =
    {
        TREASURE_CHEST = 17420676,
        CASKET_BASE    = 17420640,
    },
}

return zones[dsp.zone.MIDDLE_DELKFUTTS_TOWER]