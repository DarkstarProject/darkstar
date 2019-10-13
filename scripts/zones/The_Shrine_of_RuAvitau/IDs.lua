-----------------------------------
-- Area: The_Shrine_of_RuAvitau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_SHRINE_OF_RUAVITAU] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET   = 7049,  -- You can't fish here.
        CONQUEST_BASE            = 7149,  -- Tallying conquest results...
        SMALL_HOLE_HERE          = 7336,  -- There is a small hole here. It appears to be damp inside...
        KIRIN_OFFSET             = 7347,  -- I am Kirin, master of the Shijin. The one who stands above all. You, who have risen above your mortal status to contend with the gods... It is time to reap your reward.
        REGIME_REGISTERED        = 10339, -- New training regime registered!
        PLAYER_OBTAINS_ITEM      = 11391, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 11392, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 11393, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 11394, -- You already possess that temporary item.
        NO_COMBINATION           = 11399, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 11400, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 11401, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 11402, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 11403, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 11404, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 11405, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 11406, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 11407, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 11408, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 11409, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 11410, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 11411, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 11412, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 11414, -- The monster was concealing a treasure chest!
        HOMEPOINT_SET            = 11425, -- Home point set!
    },
    mob =
    {
        ULLIKUMMI        = 17506418,
        OLLAS_OFFSET     = 17506667,
        KIRIN            = 17506670,
    },
    npc =
    {
        DOORS =
        {
            [ 0] = "y", [ 4] = "b",
            [ 1] = "y", [ 5] = "b",
            [ 2] = "y", [ 6] = "b",
            [ 3] = "y", [ 7] = "b",
            [ 8] = "y", [ 9] = "b",
            [12] = "y", [10] = "b",
            [13] = "y", [11] = "b",
            [14] = "y", [16] = "b",
            [15] = "y", [17] = "b",
            [19] = "y", [18] = "b",
            [21] = "y", [20] = "b",
        },
        MONOLITHS =
        {
            [ 0] = "y", [ 4] = "b",
            [ 1] = "y", [ 5] = "b",
            [ 2] = "y", [ 6] = "b",
            [ 3] = "y", [ 7] = "b",
            [ 9] = "y", [ 8] = "b",
            [12] = "y", [10] = "b",
            [13] = "y", [11] = "b",
            [16] = "y", [14] = "b",
            [17] = "y", [15] = "b",
            [18] = "y", [19] = "b",
        },
        OLLAS_QM        = 17506692,
        DOOR_OFFSET     = 17506718,
        MONOLITH_OFFSET = 17506741,
        CASKET_BASE     = 17506695,
    },
}

return zones[dsp.zone.THE_SHRINE_OF_RUAVITAU]