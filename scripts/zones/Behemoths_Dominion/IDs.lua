-----------------------------------
-- Area: Behemoths_Dominion
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BEHEMOTHS_DOMINION] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388, -- Obtained: <item>.
        GIL_OBTAINED             = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING      = 6403, -- You are suddenly overcome with a sense of foreboding...
        IRREPRESSIBLE_MIGHT      = 6406, -- An aura of irrepressible might threatens to overwhelm you...
        CONQUEST_BASE            = 7049, -- Tallying conquest results...
        SOMETHING_BETTER         = 7315, -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG       = 7318, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG    = 7319, -- You have already obtained this monument's <keyitem>. Try searching for another.
        FOUND_ALL_FRAGS          = 7321, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT          = 7322, -- It is an ancient Zilart monument.
        PLAYER_OBTAINS_ITEM      = 7343, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7344, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7345, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7346, -- You already possess that temporary item.
        NO_COMBINATION           = 7351, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7352, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7353, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7354, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7355, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7356, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7357, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7358, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7359, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7360, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7361, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7362, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7363, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7364, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7366, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9529, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 11524 -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        BEHEMOTH                = 17297440,
        KING_BEHEMOTH           = 17297441,
        TALEKEEPERS_GIFT_OFFSET = 17297446,
        ANCIENT_WEAPON          = 17297449,
        LEGENDARY_WEAPON        = 17297450,
    },
    npc =
    {
        BEHEMOTH_QM      = 17297459,
        CERMET_HEADSTONE = 17297493,
        CASKET_BASE      = 17297460,
    },
}

return zones[dsp.zone.BEHEMOTHS_DOMINION]