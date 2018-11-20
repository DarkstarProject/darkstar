-----------------------------------
-- Area: Quicksand_Caves
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.QUICKSAND_CAVES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING     = 6403, -- You are suddenly overcome with a sense of foreboding...
        NOW_IS_NOT_THE_TIME     = 6404, -- Now is not the time for that!
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7208, -- You can't fish here.
        CHEST_UNLOCKED          = 7315, -- You unlock the chest!
        DOOR_FIRMLY_SHUT        = 7323, -- The door is firmly shut.
        POOL_OF_WATER           = 7355, -- It is a pool of water.
        YOU_FIND_NOTHING        = 7358, -- You find nothing.
        SOMETHING_IS_BURIED     = 7363, -- Something is buried in this fallen pillar.
        SENSE_OMINOUS_PRESENCE  = 7367, -- You sense an ominous presence...
        REGIME_REGISTERED       = 10361, -- New training regime registered!
        HOMEPOINT_SET           = 11423, -- Home point set!
    },
    mob =
    {
        Sagittarius_X_XIII_PH =
        {
            [17629296] = 17629301, -- 641 -16.786 -774
        },
        CENTURIO_X_I_PH       =
        {
            [17629232] = 17629238,
            [17629237] = 17629238,
        },
        VALOR                 = 17629185,
        HONOR                 = 17629186,
        CENTURIO_IV_VII       = 17629187,
        TRIARIUS_IV_XIV       = 17629188,
        PRINCEPS_IV_XLV       = 17629189,
        MIMIC                 = 17629190,
        ANCIENT_VESSEL        = 17629642,
        TRIBUNUS_VII_I        = 17629643,
        GIRTABLULU            = 17629645,
    },
    npc =
    {
        ANTICAN_TAG_POSITIONS =
        {
            [1] = {590.000, -6.600, -663.000},
            [2] = {748.000, 2.000, -570.000},
            [3] = {479.000, -14.000, -815.000},
            [4] = {814.000, -14.000, -761.000}
        },
        ORNATE_DOOR_OFFSET     = 17629685,
        CHAINS_THAT_BIND_US_QM = 17629738,
        TREASURE_COFFER        = 17629739,
        ANTICAN_TAG_QM         = 17629761,
    },
}

return zones[dsp.zone.QUICKSAND_CAVES]