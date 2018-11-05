-----------------------------------
-- Area: The_Shrine_of_RuAvitau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_SHRINE_OF_RUAVITAU] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET  = 7048, -- You can't fish here.
        CONQUEST_BASE           = 7148, -- Tallying conquest results...
        SMALL_HOLE_HERE         = 7335, -- There is a small hole here. It appears to be damp inside...
        KIRIN_OFFSET            = 7346, -- I am Kirin, master of the Shijin. The one who stands above all. You, who have risen above your mortal status to contend with the gods... It is time to reap your reward.
        REGIME_REGISTERED       = 10338, -- New training regime registered!
        HOMEPOINT_SET           = 11424, -- Home point set!
    },
    mob =
    {
        ULLIKUMMI        = 17506418,
        OLLAS_OFFSET     = 17506667,
        KIRIN            = 17506670,
    },
    npc =
    {
        SHRINE_DOORS     =
        {
            [ 0] = "y", [ 4] = "b",
            [ 1] = "y", [ 5] = "b",
            [ 2] = "y", [ 6] = "b",
            [ 3] = "y", [ 7] = "b",
            [ 8] = "y", [ 9] = "b",
            [12] = "y", [10] = "b",
            [13] = "y", [11] = "b",
            [14] = "y", [16] = "b",
            [15] = "y", [17] = "b",
            [19] = "y", [18] = "b",
            [21] = "y", [20] = "b",
        },
        SHRINE_MONOLITHS =
        {
            [ 0] = "y", [ 4] = "b",
            [ 1] = "y", [ 5] = "b",
            [ 2] = "y", [ 6] = "b",
            [ 3] = "y", [ 7] = "b",
            [ 9] = "y", [ 8] = "b",
            [12] = "y", [10] = "b",
            [13] = "y", [11] = "b",
            [16] = "y", [14] = "b",
            [17] = "y", [15] = "b",
            [18] = "y", [19] = "b",
        },
        OLLAS_QM               = 17506692,
        SHRINE_DOOR_OFFSET     = 17506718,
        SHRINE_MONOLITH_OFFSET = 17506741,
    },
}

return zones[dsp.zone.THE_SHRINE_OF_RUAVITAU]