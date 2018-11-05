-----------------------------------
-- Area: VeLugannon_Palace
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.VELUGANNON_PALACE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        CHEST_UNLOCKED          = 7214, -- You unlock the chest!
        REGIME_REGISTERED       = 10157, -- New training regime registered!
    },
    mob =
    {
        MIMIC            = 17502567,
        BRIGANDISH_BLADE = 17502568,
    },
    npc =
    {
        VELUGANNON_Y_DOOR_OFFSET = 17502608,
        VELUGANNON_B_DOOR_OFFSET = 17502616,
        VELUGANNON_Y_LITH_OFFSET = 17502624,
        VELUGANNON_B_LITH_OFFSET = 17502634,
        TREASURE_COFFER          = 17502699,
    },
}

return zones[dsp.zone.VELUGANNON_PALACE]