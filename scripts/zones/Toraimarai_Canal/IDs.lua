-----------------------------------
-- Area: Toraimarai Canal (169)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.TORAIMARAI_CANAL] =
{
    text =
    {
        SEALED_SHUT              = 3,     -- It's sealed shut with incredibly strong magic.
        ITEM_CANNOT_BE_OBTAINED  = 6428,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6434,  -- Obtained: <item>.
        GIL_OBTAINED             = 6435,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6437,  -- Obtained key item: <keyitem>.
        GEOMAGNETRON_ATTUNED     = 7056,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        CONQUEST_BASE            = 7095,  -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7254,  -- You can't fish here.
        CHEST_UNLOCKED           = 7362,  -- You unlock the chest!
        PLAYER_OBTAINS_ITEM      = 7531,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7532,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7533,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7534,  -- You already possess that temporary item.
        NO_COMBINATION           = 7539,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7540,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7541,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7542,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7543,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7544,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7545,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7546,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7547,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7548,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7549,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7550,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7551,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7552,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7554,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9617,  -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 10665, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        HOMEPOINT_SET            = 10693  -- Home point set!
    },
    mob =
    {
        CANAL_MOOCHER_PH =
        {
            [17469575] = 17469578,
            [17469576] = 17469578,
            [17469577] = 17469578,
        },
        KONJAC_PH =
        {
            [17469629] = 17469632,
            [17469630] = 17469632,
            [17469631] = 17469632,
        },
        MAGIC_SLUDGE      = 17469516,
        HINGE_OILS_OFFSET = 17469666,
        MIMIC             = 17469761,
    },
    npc =
    {
        TOME_OF_MAGIC_OFFSET = 17469828,
        TREASURE_COFFER      = 17469835,
        CASKET_BASE          = 17469772,
    },
}

return zones[dsp.zone.TORAIMARAI_CANAL]