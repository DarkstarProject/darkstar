-----------------------------------
-- Area: Outer_Horutoto_Ruins
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.OUTER_HORUTOTO_RUINS] =
{
    text =
    {
        ORB_ALREADY_PLACED       = 0,     -- A dark Mana Orb is already placed here.
        CONQUEST_BASE            = 15,    -- Tallying conquest results...
        DEVICE_NOT_WORKING       = 188,   -- The device is not working.
        SYS_OVERLOAD             = 197,   -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE             = 202,   -- You lost the <item>.
        ITEM_CANNOT_BE_OBTAINED  = 6587,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6593,  -- Obtained: <item>.
        GIL_OBTAINED             = 6594,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6596,  -- Obtained key item: <keyitem>.
        GEOMAGNETRON_ATTUNED     = 7215,  -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        DOOR_FIRMLY_SHUT         = 7254,  -- The door is firmly shut.
        ALL_G_ORBS_ENERGIZED     = 7257,  -- The six Mana Orbs have been successfully energized with magic!
        CHEST_UNLOCKED           = 7280,  -- You unlock the chest!
        PLAYER_OBTAINS_ITEM      = 8257,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8258,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8259,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 8260,  -- You already possess that temporary item.
        NO_COMBINATION           = 8265,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 8266,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8267,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 8268,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 8269,  -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 8270,  -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 8271,  -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 8272,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 8273,  -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 8274,  -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 8275,  -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 8276,  -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS           = 8277,  -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT       = 8278,  -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 8280,  -- The monster was concealing a treasure chest!
        REGIME_REGISTERED        = 10343, -- New training regime registered!
    },
    mob =
    {
        DESMODONT_PH                =
        {
            [17571868] = 17571870,
        },
        AH_PUCH_PH                  =
        {
            [17571893] = 17571903, -- -418,-1,629
            [17571894] = 17571903, -- -419,-1,570
            [17571895] = 17571903, -- -419,-1,581
            [17571896] = 17571903, -- -418,-1,590
            [17571897] = 17571903, -- -418,-1,597
            [17571898] = 17571903, -- -417,-1,640
            [17571899] = 17571903, -- -419,-1,615
            [17571900] = 17571903, -- -417,-1,661
        },
        BALLOON_NM_OFFSET           = 17572141,
        FULL_MOON_FOUNTAIN_OFFSET   = 17572197,
        JESTER_WHO_D_BE_KING_OFFSET = 17572201,
        APPARATUS_ELEMENTAL         = 17572203,
    },
    npc =
    {
        CASKET_BASE        = 17572223,
        GATE_MAGICAL_GIZMO = 17572248,
        TREASURE_CHEST     = 17572290,
    },
}

return zones[dsp.zone.OUTER_HORUTOTO_RUINS]