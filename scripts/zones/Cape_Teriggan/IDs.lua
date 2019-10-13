-----------------------------------
-- Area: Cape_Teriggan
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CAPE_TERIGGAN] =
{
    text =
    {
        NOTHING_HAPPENS            = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED    = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388, -- Obtained: <item>.
        GIL_OBTAINED               = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391, -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6392, -- Lost key item: <keyitem>.
        ITEMS_OBTAINED             = 6397, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE              = 7049, -- Tallying conquest results...
        BEASTMEN_BANNER            = 7130, -- There is a beastmen's banner.
        CONQUEST                   = 7217, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET     = 7550, -- You can't fish here.
        SOMETHING_BETTER           = 7662, -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG         = 7665, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG      = 7666, -- You have already obtained this monument's <keyitem>. Try searching for another.
        FOUND_ALL_FRAGS            = 7667, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        ZILART_MONUMENT            = 7669, -- It is an ancient Zilart monument.
        SENSE_OMINOUS_PRESENCE     = 7686, -- You sense an ominous presence...
        PLAYER_OBTAINS_ITEM        = 7920, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM      = 7921, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM   = 7922, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP       = 7923, -- You already possess that temporary item.
        NO_COMBINATION             = 7928, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS         = 7929, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK        = 7930, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS         = 7931, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK                = 7932, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD      = 7933, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD       = 7934, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS   = 7935, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN      = 7936, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN   = 7937, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS       = 7938, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS            = 7939, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS             = 7940, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT         = 7941, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST    = 7943, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED          = 10106, -- New training regime registered!
        COMMON_SENSE_SURVIVAL      = 11225, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        HOMEPOINT_SET              = 11253  -- Home point set!
    },
    mob =
    {
        FROSTMANE_PH           =
        {
            [17240374] = 17240376, -- -283.874 -0.660 485.504
            [17240372] = 17240376, -- -272.224 -0.942 461.321
            [17240373] = 17240376, -- -268.000 -0.558 440.000
            [17240371] = 17240376, -- -262.000 -0.700 442.000
        },
        KREUTZET               = 17240413,
        AXESARION_THE_WANDERER = 17240414,
        STOLAS                 = 17240424,
    },
    npc =
    {
        CASKET_BASE      = 17240445,
        OVERSEER_BASE    = 17240472,
        CERMET_HEADSTONE = 17240497,
    },
}

return zones[dsp.zone.CAPE_TERIGGAN]