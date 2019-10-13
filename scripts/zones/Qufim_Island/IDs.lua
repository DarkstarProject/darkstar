-----------------------------------
-- Area: Qufim_Island
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.QUFIM_ISLAND] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED        = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6388,  -- Obtained: <item>.
        GIL_OBTAINED                   = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6391,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST                   = 6392,  -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY        = 6402,  -- There is nothing out of the ordinary here.
        CONQUEST_BASE                  = 7049,  -- Tallying conquest results...
        BEASTMEN_BANNER                = 7130,  -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET         = 7208,  -- You can't fish here.
        THESE_WITHERED_FLOWERS         = 7328,  -- These withered flowers seem unable to bloom.
        NOW_THAT_NIGHT_HAS_FALLEN      = 7329,  -- Now that night has fallen, the flowers bloom with a strange glow.
        CONQUEST                       = 7377,  -- You've earned conquest points!
        AN_EMPTY_LIGHT_SWIRLS          = 7741,  -- An empty light swirls about the cave, eating away at the surroundings...
        GIGANTIC_FOOTPRINT             = 7825,  -- There is a gigantic footprint here.
        DYNA_NPC_DEFAULT_MESSAGE       = 7839,  -- You hear a mysterious, floating voice: Bring forth the <item>...
        YOU_CANNOT_ENTER_DYNAMIS       = 7851,  -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7853,  -- Players who have not reached level <number> are prohibited from entering Dynamis.
        PLAYER_OBTAINS_ITEM            = 8049,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM          = 8050,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM       = 8051,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP           = 8052,  -- You already possess that temporary item.
        NO_COMBINATION                 = 8057,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS             = 8058,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK            = 8059,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS             = 8060,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK                    = 8061,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD          = 8062,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD           = 8063,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS       = 8064,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN          = 8065,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN       = 8066,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS           = 8067,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS                = 8068,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS                 = 8069,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT             = 8070,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST        = 8072,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED              = 10333, -- New training regime registered!
        COMMON_SENSE_SURVIVAL          = 12655  -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SLIPPERY_SUCKER_PH =
        {
            [17293376] = 17293389,
            [17293377] = 17293389,
            [17293378] = 17293389,
            [17293380] = 17293389,
        },
        TRICKSTER_KINETIX_PH =
        {
            [17293533] = 17293537, -- -138.180 -20.928 228.793
            [17293534] = 17293537, -- -157.659 -25.501 235.862
            [17293535] = 17293537, -- -152.269 -20 243
            [17293536] = 17293537, -- -137.651 -23.507 231.528
        },
    },
    npc =
    {
        CASKET_BASE   = 17293677,
        OVERSEER_BASE = 17293715,
    },
}

return zones[dsp.zone.QUFIM_ISLAND]