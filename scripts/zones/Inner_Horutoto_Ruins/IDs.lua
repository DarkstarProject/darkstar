-----------------------------------
-- Area: Inner Horutoto Ruins (192)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.INNER_HORUTOTO_RUINS] =
{
    text =
    {
        PORTAL_SEALED_BY_3_MAGIC  = 8,    -- The Sealed Portal is sealed by three kinds of magic.
        PORTAL_NOT_OPEN_THAT_SIDE = 9,    -- The Sealed Portal cannot be opened from this side.
        CONQUEST_BASE             = 10,   -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED   = 6551, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6557, -- Obtained: <item>.
        GIL_OBTAINED              = 6558, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6560, -- Obtained key item: <keyitem>.
        GEOMAGNETRON_ATTUNED      = 7179, -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        NOT_BROKEN_ORB            = 7234, -- The Mana Orb in this receptacle is not broken.
        EXAMINED_RECEPTACLE       = 7235, -- You have already examined this receptacle.
        DOOR_FIRMLY_CLOSED        = 7262, -- The door is firmly closed.
        CHEST_UNLOCKED            = 7338, -- You unlock the chest!
        PLAYER_OBTAINS_ITEM       = 7401, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM     = 7402, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM  = 7403, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP      = 7404, -- You already possess that temporary item.
        NO_COMBINATION            = 7409, -- You were unable to enter a combination.
        HUNCH_GREATER_LESS        = 7410, -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK       = 7411, -- Player failed to open the lock.
        CORRECT_NUMBER_WAS        = 7412, -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK               = 7413, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD     = 7414, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD      = 7415, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS  = 7416, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN     = 7417, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN  = 7418, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS      = 7419, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS           = 7420, -- You have a hunch that the second digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        FIRST_DIGIT_IS            = 7421, -- You have a hunch that the first digit is ≺NUMBER≻, ≺NUMBER≻, or ≺NUMBER≻.
        UNABLE_TO_GET_HINT        = 7422, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST   = 7424, -- The monster was concealing a treasure chest!
        REGIME_REGISTERED         = 9487, -- New training regime registered!
        COMMON_SENSE_SURVIVAL     = 10535 -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        SLENDLIX_SPINDLETHUMB_PH =
        {
            [17563758] = 17563785, -- -238.315 -0.002 -179.249
        },
        NOCUOUS_WEAPON_PH =
        {
            [17563798] = 17563801, -- -236.855 0.476 -51.263
            [17563799] = 17563801, -- -237.426 0.5 -23.412
            [17563800] = 17563801, -- -230.732 -0.025 -52.324
        },
    },
    npc =
    {
        CASKET_BASE        = 17563838,
        PORTAL_CIRCLE_BASE = 17563861,
        TREASURE_CHEST     = 17563914,
    },
}

return zones[dsp.zone.INNER_HORUTOTO_RUINS]