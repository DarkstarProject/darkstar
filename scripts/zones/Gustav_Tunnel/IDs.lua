-----------------------------------
-- Area: Gustav Tunnel (212)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GUSTAV_TUNNEL] =
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
        REGIME_REGISTERED        = 9578,  -- New training regime registered!
        PLAYER_OBTAINS_ITEM      = 10630, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 10631, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 10632, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 10633, -- You already possess that temporary item.
        NO_COMBINATION           = 10638, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 10639, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 10640, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 10641, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 10642, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 10643, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 10644, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 10645, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 10646, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 10647, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 10648, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 10649, -- You have a hunch that the second digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        FIRST_DIGIT_IS           = 10650, -- You have a hunch that the first digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        UNABLE_TO_GET_HINT       = 10651, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 10653, -- The monster was concealing a treasure chest!
    },
    mob =
    {
        GOBLINSAVIOR_HERONOX_PH   =
        {
            [17645592] = 17645609, -- 153.000 -10.000 -53.000
            [17645605] = 17645609, -- 152.325 -10.702 -77.007
            [17645604] = 17645609, -- 165.558 -10.647 -68.537
        },
        WYVERNPOACHER_DRACHLOX_PH =
        {
            [17645633] = 17645640, -- -100.000 1.000 -44.000
            [17645634] = 17645640, -- -101.000 1.000 -29.000
            [17645644] = 17645640, -- -165.598 0.218 -21.966
            [17645643] = 17645640, -- -150.673 -0.067 -20.914
        },
        BAOBHAN_SITH_PH           =
        {
            [17645717] = 17645719, -- 171.000 9.194 55.000
            [17645718] = 17645719, -- 187.000 9.000 105.000
        },
        TAXIM_PH                  =
        {
            [17645731] = 17645742, -- -172.941 -1.220 55.577
            [17645738] = 17645742, -- -137.334 -0.108 48.105
            [17645744] = 17645742, -- -125.000 0.635 59.000
            [17645739] = 17645742, -- -118.000 -0.515 79.000
        },
        UNGUR_PH                  =
        {
            [17645764] = 17645755, -- -242.000 -0.577 120.000
            [17645792] = 17645755, -- -88.000 0.735 190.000
            [17645784] = 17645755, -- -123.856 0.239 223.303
            [17645758] = 17645755, -- -277.000 -10.000 -34.000
            [17645754] = 17645755, -- -316.000 -9.000 3.000
        },
        AMIKIRI_PH                =
        {
            [17645763] = 17645774, -- -245.000 -0.045 146.000
            [17645768] = 17645774, -- -228.872 -0.264 144.689
            [17645772] = 17645774, -- -209.552 -0.257 161.728
        },
        BUNE                      = 17645578,
        GIGAPLASM                 = 17645794,
        BARONIAL_BAT              = 17645809,
    },
    npc =
    {
        CASKET_BASE = 17645851,
    },
}

return zones[dsp.zone.GUSTAV_TUNNEL]