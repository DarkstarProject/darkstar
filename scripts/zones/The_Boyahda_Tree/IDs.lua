-----------------------------------
-- Area: The_Boyahda_Tree
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_BOYAHDA_TREE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET  = 7048, -- You can't fish here.
        CHEST_UNLOCKED          = 7155, -- You unlock the chest!
        CAN_SEE_SKY             = 7168, -- You can see the sky from here.
        SOMETHING_NOT_RIGHT     = 7169, -- Something is not right!
        CANNOT_SEE_MOON         = 7170, -- You cannot see the moon right now.
        CONQUEST_BASE           = 7171, -- Tallying conquest results...
        SENSE_OMINOUS_PRESENCE  = 7391, -- You sense an ominous presence...
        REGIME_REGISTERED       = 10334, -- New training regime registered!
        HOMEPOINT_SET           = 11432, -- Home point set!
    },
    mob =
    {
        ELLYLLON_PH          =
        {
            [17403938] = 17403939, -- 192.54 8.532 -163.41
        },
        VOLUPTUOUS_VIVIAN_PH =
        {
            [17404330] = 17404331, -- -196.178 5.592 190.971
        },
        MIMIC                = 17404336,
        AGAS                 = 17404337,
        BEET_LEAFHOPPER      = 17404338,
    },
    npc =
    {
        TREASURE_COFFER = 17404394,
    },
}

return zones[dsp.zone.THE_BOYAHDA_TREE]