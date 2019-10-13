-----------------------------------
-- Area: VeLugannon_Palace
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.VELUGANNON_PALACE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        CONQUEST_BASE            = 7049,  -- Tallying conquest results...
        CHEST_UNLOCKED           = 7216,  -- You unlock the chest!
        REGIME_REGISTERED        = 10159, -- New training regime registered!
        PLAYER_OBTAINS_ITEM      = 11211, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 11212, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 11213, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 11214, -- You already possess that temporary item.
        NO_COMBINATION           = 11219, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 11220, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 11221, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 11222, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 11223, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 11224, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 11225, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 11226, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 11227, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 11228, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 11229, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 11230, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 11231, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 11232, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 11234, -- The monster was concealing a treasure chest!
    },
    mob =
    {
        MIMIC            = 17502567,
        BRIGANDISH_BLADE = 17502568,
    },
    npc =
    {
        Y_DOOR_OFFSET   = 17502608,
        B_DOOR_OFFSET   = 17502616,
        Y_LITH_OFFSET   = 17502624,
        B_LITH_OFFSET   = 17502634,
        TREASURE_COFFER = 17502699,
        CASKET_BASE     = 17502585,
    },
}

return zones[dsp.zone.VELUGANNON_PALACE]