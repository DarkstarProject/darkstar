-----------------------------------
-- Area: Batallia_Downs
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BATALLIA_DOWNS] =
{
    text =
    {
        NOTHING_HAPPENS          = 141,  -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6404, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6410, -- Obtained: <item>.
        GIL_OBTAINED             = 6411, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6413, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6424, -- There is nothing out of the ordinary here.
        CONQUEST_BASE            = 7071, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7230, -- You can't fish here.
        DIG_THROW_AWAY           = 7243, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7245, -- You dig and you dig, but find nothing.
        PLAYER_OBTAINS_ITEM      = 7695, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7696, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7697, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7698, -- You already possess that temporary item.
        NO_COMBINATION           = 7703, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7704, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7705, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7706, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7707, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7708, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7709, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7710, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7711, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7712, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7713, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7714, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7715, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7716, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7718, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9981, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 12834 -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        PRANKSTER_MAVERIX_PH =
        {
            [17207635] = 17207640,
            [17207636] = 17207640,
            [17207637] = 17207640,
            [17207638] = 17207640,
            [17207639] = 17207640,
        },
        TOTTERING_TOBY_PH =
        {
            [17207449] = 17207476, -- -194.234 -18.485 132.208
        },
        AHTU              = 17207657,
        STURMTIGER        = 17207696,
        SUPARNA           = 17207697,
        SUPARNA_FLEDGLING = 17207698,
        VEGNIX_GREENTHUMB = 17207710,
    },
    npc =
    {
        CASKET_BASE   = 17207793,
    },
}

return zones[dsp.zone.BATALLIA_DOWNS]