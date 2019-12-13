-----------------------------------
-- Area: Yhoator_Jungle
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.YHOATOR_JUNGLE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6382,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6388,  -- Obtained: <item>.
        GIL_OBTAINED                = 6389,  -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6391,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST                = 6392,  -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6402,  -- There is nothing out of the ordinary here.
        CONQUEST_BASE               = 7049,  -- Tallying conquest results...
        BEASTMEN_BANNER             = 7130,  -- There is a beastmen's banner.
        CONQUEST                    = 7217,  -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET      = 7550,  -- You can't fish here.
        DIG_THROW_AWAY              = 7563,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                = 7565,  -- You dig and you dig, but find nothing.
        ALREADY_OBTAINED_TELE       = 7650,  -- You already possess the gate crystal for this telepoint.
        LOGGING_IS_POSSIBLE_HERE    = 7663,  -- Logging is possible here if you have <item>.
        HARVESTING_IS_POSSIBLE_HERE = 7670,  -- Harvesting is possible here if you have <item>.
        TREE_CHECK                  = 7677,  -- The hole in this tree is filled with a sweet-smelling liquid.
        TREE_FULL                   = 7678,  -- Your wine barrel is already full.
        WATER_HOLE                  = 7681,  -- There is an Opo-opo drinking well here. It seems they feast here, too.
        FAINT_CRY                   = 7682,  -- You hear the cry of a famished Opo-opo!
        PAMAMAS                     = 7685,  -- You might be able to draw an Opo-opo here if you had more pamamas.
        SOMETHING_IS_BURIED_HERE    = 7727,  -- It looks like something is buried here. If you had <item> you could dig it up.
        PLAYER_OBTAINS_ITEM         = 7816,  -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM       = 7817,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM    = 7818,  -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP        = 7819,  -- You already possess that temporary item.
        NO_COMBINATION              = 7824,  -- You were unable to enter a combination.
        REGIME_REGISTERED           = 10002, -- New training regime registered!
        COMMON_SENSE_SURVIVAL       = 11121, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        HOAR_KNUCKLED_RIMBERRY_PH =
        {
            [17285392] = 17285394,
            [17285393] = 17285394,
        },
        WOODLAND_SAGE          = 17285220,
        POWDERER_PENNY         = 17285248,
        BISQUE_HEELED_SUNBERRY = 17285460,
        BRIGHT_HANDED_KUNBERRY = 17285526,
        KAPPA_AKUSO            = 17285544,
        KAPPA_BONZE            = 17285545,
        KAPPA_BIWA             = 17285546,
        EDACIOUS_OPO_OPO       = 17285571,
    },
    npc =
    {
        CASKET_BASE       = 17285618,
        OVERSEER_BASE     = 17285649,
        PEDDLESTOX        = 17285685,
        BEASTMEN_TREASURE =
        {
            17285695, -- qm4
            17285688, -- qm5
            17285689, -- qm6
            17285690, -- qm7
            17285691, -- qm8
            17285692, -- qm9
            17285693, -- qm10
            17285694, -- qm11
        },
        HARVESTING =
        {
            17285680,
            17285681,
            17285682,
        },
        LOGGING =
        {
            17285674,
            17285675,
            17285676,
            17285677,
            17285678,
            17285679,
        },
    },
}

return zones[dsp.zone.YHOATOR_JUNGLE]
