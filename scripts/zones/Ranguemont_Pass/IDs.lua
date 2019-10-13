-----------------------------------
-- Area: Ranguemont Pass (166)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.RANGUEMONT_PASS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING      = 6403,  -- You are suddenly overcome with a sense of foreboding...
        GEOMAGNETRON_ATTUNED     = 7010,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        CONQUEST_BASE            = 7049,  -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7208,  -- You can't fish here.
        REGIME_REGISTERED        = 9518,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 10669, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        PLAYER_OBTAINS_ITEM      = 10570, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 10571, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 10572, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 10573, -- You already possess that temporary item.
        NO_COMBINATION           = 10578, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 10579, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 10580, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 10581, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 10582, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 10583, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 10584, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 10585, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 10586, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 10587, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 10588, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 10589, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 10590, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 10591, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 10593, -- The monster was concealing a treasure chest!
    },
    mob =
    {
        GLOOM_EYE_PH =
        {
            [17457200] = 17457204,
        },
        TAISAIJIN_PH =
        {
            17457213, -- -18.325 1.830 -114.932
            17457214, -- -5.188 11.730 -141.503
            17457215, -- 59.15 -120 50
        },
        TAISAIJIN    = 17457216,
        TROS         = 17457309,
    },
    npc =
    {
        CASKET_BASE  = 17457315,
    },
}

return zones[dsp.zone.RANGUEMONT_PASS]