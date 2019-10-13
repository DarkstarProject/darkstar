-----------------------------------
-- Area: Upper_Delkfutts_Tower
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.UPPER_DELKFUTTS_TOWER] =
{
    text =
    {
        THIS_ELEVATOR_GOES_DOWN  = 25,    -- This elevator goes down, but it is locked. Perhaps a key is needed to activate it.
        ITEM_CANNOT_BE_OBTAINED  = 6417,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6423,  -- Obtained: <item>.
        GIL_OBTAINED             = 6424,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6426,  -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET   = 7084,  -- You can't fish here.
        CONQUEST_BASE            = 7184,  -- Tallying conquest results...
        CHEST_UNLOCKED           = 7351,  -- You unlock the chest!
        PLAYER_OBTAINS_ITEM      = 7374,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7375,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7376,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7377,  -- You already possess that temporary item.
        NO_COMBINATION           = 7382,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7383,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7384,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7385,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7386,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7387,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7388,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7389,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7390,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7391,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7392,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7393,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7394,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7395,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7397,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9460,  -- New training regime registered!
        HOMEPOINT_SET            = 10516, -- Home point set!
    },
    mob =
    {
        ENKELADOS_PH =
        {
            [17424388] = 17424385, -- -371.586 -144.367 28.244
            [17424426] = 17424423, -- -215.194 -144.099 19.528
        },
        IXTAB_PH =
        {
            [17424472] = 17424475,
            [17424473] = 17424475,
            [17424474] = 17424475,
            [17424509] = 17424512,
            [17424510] = 17424512,
            [17424511] = 17424512,
        },
        PALLAS       = 17424444,
        ALKYONEUS    = 17424480,
    },
    npc =
    {
        TREASURE_CHEST = 17424563,
        CASKET_BASE    = 17424524,
    },
}

return zones[dsp.zone.UPPER_DELKFUTTS_TOWER]