-----------------------------------
-- Area: Carpenters_Landing
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CARPENTERS_LANDING] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6396, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE              = 7048, -- Tallying conquest results...
        CRYPTONBERRY_FALLEN_TREE   = 7245, -- A tree has fallen here...
        CRYPTONBERRY_EXECUTOR_POP  = 7246, -- You feel a wave of hatred wash over you!
        FISHING_MESSAGE_OFFSET     = 7269, -- You can't fish here.
        LOGGING_IS_POSSIBLE_HERE   = 7386, -- Logging is possible here if you have <item>.
        BEUGUNGEL_SHOP_DIALOG      = 7418, -- Hello, [sir/ma'am]! I'm selling goods direct from the Carpenters' Guild.
        CRYPTONBERRY_EXECUTOR_DIE  = 7470, -- ...Cleave our foesss with barren hate.
        CRYPTONBERRY_ASSASSIN_2HR  = 7471, -- ..Take up thy lanternsss. The truth we shall illuminate.
        CRYPTONBERRY_EXECUTOR_2HR  = 7472, -- Through this we ssseek our just reward...
        MYCOPHILE_MUSHROOM         = 7489, -- There is a rotten mushroom here. There are 3 openings in its cap.
    },
    mob =
    {
        ORCTRAP_PH            = 
        {
            [16785673] = 16785676, -- 181.819 -5.887 -524.872
        },
        TEMPEST_TIGON         = 16785593,
        OVERGROWN_IVY         = 16785709,
        CRYPTONBERRY_EXECUTOR = 16785710,
        MYCOPHILE             = 16785722,
    },
    npc =
    {
        LOGGING =
        {
            16785773,
            16785774,
            16785775,
            16785776,
        },
    },
}

return zones[dsp.zone.CARPENTERS_LANDING]