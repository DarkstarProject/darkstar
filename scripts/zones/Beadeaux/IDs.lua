-----------------------------------
-- Area: Beadeaux
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BEADEAUX] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED          = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6387, -- Obtained: <item>.
        GIL_OBTAINED                     = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6390, -- Obtained key item: <keyitem>.
        NOT_ENOUGH_GIL                   = 6392, -- You do not have enough gil.
        ITEMS_OBTAINED                   = 6396, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY          = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                    = 7048, -- Tallying conquest results...
        LOCKED_DOOR_QUADAV_HAS_KEY       = 7211, -- It is locked tight, but has what looks like a keyhole. Maybe one of the Quadav here has the key.
        YOU_CAN_NOW_BECOME_A_DARK_KNIGHT = 7348, -- You can now become a dark knight!
        CHEST_UNLOCKED                   = 7358, -- You unlock the chest!
        CHEST_FAIL                       = 7359, -- <name> fails to open the chest.
        CHEST_TRAP                       = 7360, -- The chest was trapped!
        CHEST_WEAK                       = 7361, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC                      = 7362, -- The chest was a mimic!
        CHEST_MOOGLE                     = 7363, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION                   = 7364, -- The chest was but an illusion...
        CHEST_LOCKED                     = 7365, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
    },
    mob =
    {
        MIMIC                  = 17379783,
        BI_GHO_HEADTAKER_PH    = 
        {
            [17379350] = 17379351, -- -98.611 0.498 71.212
        },
        DA_DHA_HUNDREDMASK_PH  = 
        {
            [17379426] = 17379427, -- -71.480 0.490 -62.882
        },
        GE_DHA_EVILEYE_PH      =
        {
            [17379447] = 17379450, -- -242.709 0.5 -188.01
        },
        ZO_KHU_BLACKCLOUD_PH   = 
        {
            [17379562] = 17379564, -- -294.223 -3.504 -206.657
        },
        GA_BHU_UNVANQUISHED_PH = 
        {
            [17379625] = 17379626, -- 139.642 -2.445 161.557
        },
    },
    npc =
    {
        BEADEAUX_TREASURE_CHEST  = 17379842,
        BEADEAUX_TREASURE_COFFER = 17379843,
    },
}

return zones[dsp.zone.BEADEAUX]