-----------------------------------
-- Area: Gusgen Mines (196)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GUSGEN_MINES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        GEOMAGNETRON_ATTUNED     = 7010,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        CONQUEST_BASE            = 7049,  -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7208,  -- You can't fish here.
        DEVICE_NOT_WORKING       = 7322,  -- The device is not working.
        SYS_OVERLOAD             = 7331,  -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE             = 7336,  -- You lost the <item>.
        LOCK_OTHER_DEVICE        = 7339,  -- This entrance's lock is connected to some other device.
        MINING_IS_POSSIBLE_HERE  = 7359,  -- Mining is possible here if you have <item>.
        CHEST_UNLOCKED           = 7374,  -- You unlock the chest!
        LETTERS_IS_WRITTEN_HERE  = 7382,  -- Something resembling letters is written here.
        FOUND_LOCATION_SEAL      = 7383,  -- You have found the location of the seal. You place <item> on it.
        IS_ON_THIS_SEAL          = 7384,  -- <item> is on this seal.
        PLAYER_OBTAINS_ITEM      = 8297,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8298,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8299,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 8300,  -- You already possess that temporary item.
        NO_COMBINATION           = 8305,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 8306,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8307,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 8308,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 8309,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 8310,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 8311,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 8312,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 8313,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 8314,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 8315,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 8316,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 8317,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 8318,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 8320,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 10383, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 11465  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        BLIND_MOBY          = 17580038,
        WANDERING_GHOST     = 17580337,
        APPARATUS_ELEMENTAL = 17580340,
    },
    npc =
    {
        CASKET_BASE    = 17580348,
        TREASURE_CHEST = 17580403,
        MINING =
        {
            17580397,
            17580398,
            17580399,
            17580400,
            17580401,
            17580402,
        },
    },
}

return zones[dsp.zone.GUSGEN_MINES]