-----------------------------------
-- Area: Lower_Delkfutts_Tower
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.LOWER_DELKFUTTS_TOWER] =
{
    text =
    {
        CONQUEST_BASE                    = 0,     -- Tallying conquest results...
        THE_DOOR_IS_FIRMLY_SHUT_OPEN_KEY = 159,   -- The door is firmly shut. You might be able to open it if you had the key.
        DOOR_FIRMLY_SHUT                 = 160,   -- The door is firmly shut.
        ITEM_CANNOT_BE_OBTAINED          = 6571,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6577,  -- Obtained: <item>.
        GIL_OBTAINED                     = 6578,  -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6580,  -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET           = 7238,  -- You can't fish here.
        PLAYER_OBTAINS_ITEM              = 8621,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM            = 8622,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM         = 8623,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP             = 8624,  -- You already possess that temporary item.
        NO_COMBINATION                   = 8629,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS               = 8630,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK              = 8631,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS               = 8632,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK                      = 8633,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD            = 8634,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD             = 8635,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS         = 8636,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN            = 8637,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN         = 8638,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS             = 8639,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS                  = 8640,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS                   = 8641,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT               = 8642,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST          = 8644,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED                = 10707, -- New training regime registered!
        COMMON_SENSE_SURVIVAL            = 11761  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        HIPPOLYTOS_PH =
        {
            [17531000] = 17530999, -- 337.079 -16.1 17.386
            [17531002] = 17530999, -- 346.244 -16.126 10.373
        },
        EPIALTES_PH   =
        {
            [17530882] = 17530881, -- 432.952 -0.350 -3.719
            [17530887] = 17530881, -- 484.735 0.046 23.048
        },
        EURYMEDON_PH  =
        {
            [17531118] = 17531114, -- 397.252 -32.128 -32.807
        },
        DISASTER_IDOL = 17531121,
    },
    npc =
    {
        CASKET_BASE = 17531134,
    },
}

return zones[dsp.zone.LOWER_DELKFUTTS_TOWER]