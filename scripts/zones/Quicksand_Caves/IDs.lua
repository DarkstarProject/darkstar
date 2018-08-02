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
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        SENSE_OF_FOREBODING     = 6402, -- You are suddenly overcome with a sense of foreboding...
        NOW_IS_NOT_THE_TIME     = 6403, -- Now is not the time for that!
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7207, -- You can't fish here.
        CHEST_UNLOCKED          = 7314, -- You unlock the chest!
        CHEST_FAIL              = 7315, -- Fails to open the chest.
        CHEST_TRAP              = 7316, -- The chest was trapped!
        CHEST_WEAK              = 7317, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7318, -- The chest was a mimic!
        CHEST_MOOGLE            = 7319, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7320, -- The chest was but an illusion...
        CHEST_LOCKED            = 7321, -- The chest appears to be locked.
        DOOR_FIRMLY_SHUT        = 7322, -- The door is firmly shut.
        POOL_OF_WATER           = 7354, -- It is a pool of water.
        YOU_FIND_NOTHING        = 7357, -- You find nothing.
        SOMETHING_IS_BURIED     = 7362, -- Something is buried in this fallen pillar.
        SENSE_OMINOUS_PRESENCE  = 7366, -- You sense an ominous presence...
        NOTHING_OUT_OF_ORDINARY = 7367, -- There is nothing out of the ordinary here.
        HOMEPOINT_SET           = 11422, -- Home point set!
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
        TRIBUNUS_VII_I_QM      = 17629661,
        QC_ORNATE_DOOR_OFFSET  = 17629685,
        CHAINS_THAT_BIND_US_QM = 17629738,
        QC_TREASURE_COFFER     = 17629739,
        ANTICAN_TAG_QM         = 17629761,
    },
}

return zones[dsp.zone.QUICKSAND_CAVES]