-----------------------------------
-- Area: Sauromugue_Champaign
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SAUROMUGUE_CHAMPAIGN] =
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
        MANY_TIGER_BONES         = 7230, -- There are many tiger bones here...
        OLD_SABERTOOTH_DIALOG_I  = 7236, -- You hear the distant roar of a tiger. It sounds as if the beast is approaching slowly...
        OLD_SABERTOOTH_DIALOG_II = 7237, -- The sound of the tiger's footsteps is growing louder.
        FISHING_MESSAGE_OFFSET   = 7238, -- You can't fish here.
        DIG_THROW_AWAY           = 7251, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7253, -- You dig and you dig, but find nothing.
        THF_AF_MOB               = 7415, -- Something has come down from the tower!
        THF_AF_WALL_OFFSET       = 7434, -- It is impossible to climb this wall with your bare hands.
        PLAYER_OBTAINS_ITEM      = 7502, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7503, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7504, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7505, -- You already possess that temporary item.
        NO_COMBINATION           = 7510, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7511, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7512, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7513, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7514, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7515, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7516, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7517, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7518, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7519, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7520, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7521, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7522, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7523, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7525, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9811, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 12496 -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        DEADLY_DODO_PH     =
        {
            [17268849] = 17268851, -- 238.000 40.000 332.000
            [17268850] = 17268851, -- 369.564 39.658 345.197
        },
        BLIGHTING_BRAND_PH =
        {
            [17269013] = 17269016, -- 240.725 1.853 223.185
        },
        OLD_SABERTOOTH     = 17268808,
        ROC                = 17269106,
        CLIMBPIX_HIGHRISE  = 17269107,
        DRIBBLIX_GREASEMAW = 17269114,
    },
    npc =
    {
        CASKET_BASE = 17269189,
    },
}

return zones[dsp.zone.SAUROMUGUE_CHAMPAIGN]