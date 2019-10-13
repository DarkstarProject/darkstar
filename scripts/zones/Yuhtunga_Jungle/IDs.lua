-----------------------------------
-- Area: Yuhtunga_Jungle
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.YUHTUNGA_JUNGLE] =
{
    text =
    {
        NOTHING_HAPPENS             = 119,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED     = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6388,  -- Obtained: <item>.
        GIL_OBTAINED                = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6391,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST                = 6392,  -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6402,  -- There is nothing out of the ordinary here.
        CONQUEST_BASE               = 7049,  -- Tallying conquest results...
        BEASTMEN_BANNER             = 7130,  -- There is a beastmen's banner.
        CONQUEST                    = 7217,  -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET      = 7550,  -- You can't fish here.
        DIG_THROW_AWAY              = 7563,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                = 7565,  -- You dig and you dig, but find nothing.
        FLOWER_BLOOMING             = 7656,  -- A large flower is blooming.
        FOUND_NOTHING_IN_FLOWER     = 7659,  -- You find nothing inside the flower.
        FEEL_DIZZY                  = 7660,  -- You feel slightly dizzy. You must have breathed in too much of the pollen.
        SOMETHING_BETTER            = 7673,  -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG          = 7676,  -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG       = 7677,  -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS      = 7678,  -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS             = 7679,  -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT             = 7680,  -- It is an ancient Zilart monument.
        LOGGING_IS_POSSIBLE_HERE    = 7697,  -- Logging is possible here if you have <item>.
        HARVESTING_IS_POSSIBLE_HERE = 7704,  -- Harvesting is possible here if you have <item>.
        SOMETHING_IS_BURIED_HERE    = 7752,  -- It looks like something is buried here. If you had <item> you could dig it up.
        PLAYER_OBTAINS_ITEM         = 7865,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM       = 7866,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM    = 7867,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP        = 7868,  -- You already possess that temporary item.
        NO_COMBINATION              = 7873,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS          = 7874,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK         = 7875,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS          = 7876,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK                 = 7877,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD       = 7878,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD        = 7879,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS    = 7880,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN       = 7881,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN    = 7882,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS        = 7883,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS             = 7884,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS              = 7885,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT          = 7886,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST     = 7888,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED           = 10051, -- New training regime registered!
        COMMON_SENSE_SURVIVAL       = 12045  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        MISCHIEVOUS_MICHOLAS_PH =
        {
            [17281148] = 17281149, -- -265.616 -0.5 -24.389
        },
        TIPHA                   = 17281030,
        CARTHI                  = 17281031,
        ROSE_GARDEN_PH          = 17281356,
        ROSE_GARDEN             = 17281357,
        VOLUPTUOUS_VILMA        = 17281358,
    },
    npc =
    {
        CASKET_BASE           = 17281558,
        BLUE_RAFFLESIA_OFFSET = 17281585,
        OVERSEER_BASE         = 17281599,
        CERMET_HEADSTONE      = 17281624,
        PEDDLESTOX            = 17281639,
        BEASTMEN_TREASURE     =
        {
            17281642, -- qm3
            17281643, -- qm4
            17281644, -- qm5
            17281645, -- qm6
            17281646, -- qm7
            17281647, -- qm8
            17281648, -- qm9
            17281649, -- qm10
        },
        HARVESTING =
        {
            17281635,
            17281636,
            17281637,
        },
        LOGGING =
        {
            17281629,
            17281630,
            17281631,
            17281632,
            17281633,
            17281634,
        },
    },
}

return zones[dsp.zone.YUHTUNGA_JUNGLE]
