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
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE               = 7048, -- Tallying conquest results...
        BEASTMEN_BANNER             = 7129, -- There is a beastmen's banner.
        CONQUEST                    = 7216, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET      = 7549, -- You can't fish here.
        DIG_THROW_AWAY              = 7562, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                = 7564, -- You dig and you dig, but find nothing.
        ALREADY_OBTAINED_TELE       = 7649, -- You already possess the gate crystal for this telepoint.
        LOGGING_IS_POSSIBLE_HERE    = 7662, -- Logging is possible here if you have <item>.
        HARVESTING_IS_POSSIBLE_HERE = 7669, -- Harvesting is possible here if you have <item>.
        TREE_CHECK                  = 7676, -- The hole in this tree is filled with a sweet-smelling liquid.
        TREE_FULL                   = 7677, -- Your wine barrel is already full.
        WATER_HOLE                  = 7680, -- There is an Opo-opo drinking well here. It seems they feast here, too.
        FAINT_CRY                   = 7681, -- You hear the cry of a famished Opo-opo!
        PAMAMAS                     = 7684, -- You might be able to draw an Opo-opo here if you had more pamamas.
        REGIME_REGISTERED           = 9999, -- New training regime registered!
    },
    mob =
    {
        WOODLAND_SAGE          = 17285220,
        BISQUE_HEELED_SUNBERRY = 17285460,
        BRIGHT_HANDED_KUNBERRY = 17285526,
        KAPPA_AKUSO            = 17285544,
        KAPPA_BONZE            = 17285545,
        KAPPA_BIWA             = 17285546,
        EDACIOUS_OPO_OPO       = 17285571,
    },
    npc =
    {
        EDACIOUS_OPO_OPO_QM = 17285615,
        OVERSEER_BASE       = 17285648,
        HARVESTING =
        {
            17285679,
            17285680,
            17285681,
        },
        LOGGING =
        {
            17285673,
            17285674,
            17285675,
            17285676,
            17285677,
            17285678,
        },
    },
}

return zones[dsp.zone.YHOATOR_JUNGLE]