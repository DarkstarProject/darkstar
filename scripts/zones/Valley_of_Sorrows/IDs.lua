-----------------------------------
-- Area: Valley_of_Sorrows
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.VALLEY_OF_SORROWS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388, -- Obtained: <item>.
        GIL_OBTAINED               = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6397, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6402, -- There is nothing out of the ordinary here.
        AURA_THREATENS             = 6406, -- An aura of irrepressible might threatens to overwhelm you...
        CONQUEST_BASE              = 7049, -- Tallying conquest results...
        SOMETHING_BURRIED          = 7308, -- It looks like something was buried here.
        PLAYER_OBTAINS_ITEM        = 7498, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM      = 7499, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM   = 7500, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP       = 7501, -- You already possess that temporary item.
        NO_COMBINATION             = 7506, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS         = 7507, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK        = 7508, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS         = 7509, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK                = 7510, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD      = 7511, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD       = 7512, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS   = 7513, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN      = 7514, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN   = 7515, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS       = 7516, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS            = 7517, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS             = 7518, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT         = 7519, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST    = 7521, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED          = 9684, -- New training regime registered!
        COMMON_SENSE_SURVIVAL      = 10803 -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        ADAMANTOISE   = 17301537,
        ASPIDOCHELONE = 17301538,
    },
    npc =
    {
        CASKET_BASE    = 17301544,
        ADAMANTOISE_QM = 17301567,
    },
}

return zones[dsp.zone.VALLEY_OF_SORROWS]