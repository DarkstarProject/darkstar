-----------------------------------
-- Area: Korroloka Tunnel (173)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.KORROLOKA_TUNNEL] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388,  -- Obtained: <item>.
        GIL_OBTAINED             = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6402,  -- There is nothing out of the ordinary here.
        SENSE_OF_BOREBODING      = 6403,  -- You are suddenly overcome with a sense of foreboding...
        FISHING_MESSAGE_OFFSET   = 7049,  -- You can't fish here.
        CONQUEST_BASE            = 7149,  -- Tallying conquest results...
        GEOMAGNETRON_ATTUNED     = 7010,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        MINING_IS_POSSIBLE_HERE  = 7308,  -- Mining is possible here if you have <item>.
        ENTERED_SPRING           = 7324,  -- The water in this spring is pleasant and tepid. This looks like a nice place to warm yourself up.
        LEFT_SPRING_EARLY        = 7325,  -- You are not warm enough yet. You will need to spend more time than that in the spring to get your body heated up.
        LEFT_SPRING_CLEAN        = 7326,  -- Your whole body is piping hot, and the smell of the Rafflesia pollen is gone!
        MORION_WORM_1            = 7329,  -- It appears to be a hole made by some kind of animal. Fragments of iron ore are scattered around the area...
        REGIME_REGISTERED        = 9457,  -- New training regime registered!
        PLAYER_OBTAINS_ITEM      = 10509, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 10510, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 10511, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 10512, -- You already possess that temporary item.
        NO_COMBINATION           = 10517, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 10518, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 10519, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 10520, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 10521, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 10522, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 10523, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 10524, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 10525, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 10526, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 10527, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 10528, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 10529, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 10530, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 10532, -- The monster was concealing a treasure chest!
    },
    mob =
    {
        CARGO_CRAB_COLIN_PH =
        {
            [17486002] = 17485980, -- -30.384 1.000 -33.277
            [17486095] = 17485980, -- -85.000 -0.500 -37.000
        },
        DAME_BLANCHE_PH     =
        {
            [17486128] = 17486129, -- -345.369 0.716 119.486
            [17486127] = 17486129, -- -319.266 -0.244 130.650
            [17486126] = 17486129, -- -319.225 -0.146 109.776
            [17486124] = 17486129, -- -296.821 -3.207 131.239
            [17486125] = 17486129, -- -292.487 -5.993 141.408
            [17486119] = 17486129, -- -277.338 -9.352 139.763
            [17486118] = 17486129, -- -276.713 -9.954 135.353
        },
        FALCATUS_ARANEI_PH  =
        {
            [17486033] = 17486031, -- -68.852 -5.029 141.069
            [17486032] = 17486031, -- -94.545 -6.095 136.480
            [17486034] = 17486031, -- -79.827 -6.046 133.982
            [17486027] = 17486031, -- -25.445 -6.073 142.192
            [17486028] = 17486031, -- -33.446 -6.038 141.987
        },
        KORROLOKA_LEECH_I   = 17486187,
        KORROLOKA_LEECH_II  = 17486188,
        KORROLOKA_LEECH_III = 17486189,
        MORION_WORM         = 17486190,
    },
    npc =
    {
        EXCAVATION =
        {
            17486253,
            17486254,
            17486255,
            17486256,
            17486257,
            17486258,
        },
        MORION_WORM_QM = 17486213,
        CASKET_BASE    = 17486215,
    },
}

return zones[dsp.zone.KORROLOKA_TUNNEL]