-----------------------------------
-- Area: East_Sarutabaruta
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.EAST_SARUTABARUTA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388, -- Obtained: <item>.
        GIL_OBTAINED             = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE            = 7049, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7208, -- You can't fish here.
        DIG_THROW_AWAY           = 7221, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7223, -- You dig and you dig, but find nothing.
        SIGNPOST_OFFSET          = 7378, -- Southeast: South Tower, Horutoto Ruins Southwest: Windurst Woods
        TABY_CANATAHEY_DIALOG    = 7388, -- This is the entrrrance to Windurst. Please maintain orderrrly conduct while you'rrre in town.
        HEIH_PORHIAAP_DIALOG     = 7389, -- These grrrasslands make up East Sarutabaruta. Lately the number of monsters has drrramatically increased, causing us all sorts of trrrouble.
        SAMA_GOHJIMA_PREDIALOG   = 7391, -- The ministerrr of the Orastery is in the laborrratory beneath here. To get there, you should check the walls verrry carrrefully.
        SAMA_GOHJIMA_POSTDIALOG  = 7392, -- Were you able to find the laborrratory? There are many such hidden passages in the Horutoto Ruins.
        PLAYER_OBTAINS_ITEM      = 7556, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 7557, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 7558, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 7559, -- You already possess that temporary item.
        NO_COMBINATION           = 7564, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7565, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 7566, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 7567, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 7568, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 7569, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 7570, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 7571, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 7572, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 7573, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 7574, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 7575, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 7576, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 7577, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 7579, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 9924, -- New training regime registered!
    },
    mob =
    {
        SHARP_EARED_ROPIPI_PH =
        {
            [17252507] = 17252489, -- 363.152 -16.705 -326.213
            [17252506] = 17252489, -- 303.282 -17.642 -415.870
            [17252487] = 17252489, -- 224.258 -17.858 -486.256
            [17252488] = 17252489, -- 227.825 -16.978 -317.467
        },
        SPINY_SPIPI_PH =
        {
            [17252656] = 17252657
        },
        DUKE_DECAPOD   = 17252725,
    },
    npc =
    {
        CASKET_BASE = 17252999,
    },
}

return zones[dsp.zone.EAST_SARUTABARUTA]