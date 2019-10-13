-----------------------------------
-- Area: King Ranperres Tomb (190)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.KING_RANPERRES_TOMB] =
{
    text =
    {
        CONQUEST_BASE            = 0,     -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED  = 6541,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6547,  -- Obtained: <item>.
        GIL_OBTAINED             = 6548,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6550,  -- Obtained key item: <keyitem>.
        GEOMAGNETRON_ATTUNED     = 7169,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        CHEST_UNLOCKED           = 7279,  -- You unlock the chest!
        HEAVY_DOOR               = 7307,  -- It is a solid stone door.
        PLAYER_OBTAINS_ITEM      = 8245,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8246,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8247,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 8248,  -- You already possess that temporary item.
        NO_COMBINATION           = 8253,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 8254,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8255,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 8256,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 8257,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 8258,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 8259,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 8260,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 8261,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 8262,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 8263,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 8264,  -- You have a hunch that the second digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        FIRST_DIGIT_IS           = 8265,  -- You have a hunch that the first digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        UNABLE_TO_GET_HINT       = 8266,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 8268,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 10331, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 11418  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        GWYLLGI_PH            =
        {
            [17555661] = 17555664,
        },
        CRYPT_GHOST_PH        =
        {
            [17555665] = 17555668,
            [17555666] = 17555668,
            [17555667] = 17555668,
        },
        BARBASTELLE           = 17555721,
        CHERRY_SAPLING_OFFSET = 17555853,
        VRTRA                 = 17555890,
        CORRUPTED_YORGOS      = 17555898,
        CORRUPTED_SOFFEIL     = 17555899,
        CORRUPTED_ULBRIG      = 17555900,
    },
    npc =
    {
        TREASURE_CHEST = 17555955,
        CASKET_BASE    = 17555907,
    },
}

return zones[dsp.zone.KING_RANPERRES_TOMB]