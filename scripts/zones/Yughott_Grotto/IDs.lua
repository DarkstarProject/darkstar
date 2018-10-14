-----------------------------------
-- Area: Yughott_Grotto
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.YUGHOTT_GROTTO] =
{
    text =
    {
        CONQUEST_BASE           = 0,    -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6546, -- Obtained: <item>.
        GIL_OBTAINED            = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6549, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET  = 7207, -- You can't fish here.
        CHEST_UNLOCKED          = 7332, -- You unlock the chest!
        CHEST_FAIL              = 7333, -- <name> fails to open the chest.
        CHEST_TRAP              = 7334, -- The chest was trapped!
        CHEST_WEAK              = 7335, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7336, -- The chest was a mimic!
        CHEST_MOOGLE            = 7337, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7338, -- The chest was but an illusion...
        CHEST_LOCKED            = 7339, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
        MINING_IS_POSSIBLE_HERE = 7340, -- Mining is possible here if you have <item>.
        HOMEPOINT_SET           = 7440, -- Home point set!
    },
    mob =
    {
        ASHMAKER_GOTBLUT_PH = 
        {
            [17358926] = 17358932, -- 16.179 -1.321 -27.321
            [17358920] = 17358932, -- 11.790 -1.379 -19.023
            [17358913] = 17358932, -- -8.000 -0.500 -53.000
            [17358929] = 17358932, -- 16.061 -1.383 10.996
            [17358925] = 17358932, -- 10.890 -1.256 2.267
        },
    },
    npc =
    {
        YUGHOTT_TREASURE_CHEST = 17359052,
        MINING =
        {
            17359053,
            17359054,
            17359055,
            17359056,
            17359057,
            17359058,
        },
    },
}

return zones[dsp.zone.YUGHOTT_GROTTO]