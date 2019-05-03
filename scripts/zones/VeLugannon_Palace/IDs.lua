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
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        CHEST_UNLOCKED          = 7216, -- You unlock the chest!
        REGIME_REGISTERED       = 10159, -- New training regime registered!
    },
    mob =
    {
        MIMIC            = 17502567,
        BRIGANDISH_BLADE = 17502568,
    },
    npc =
    {
        Y_DOOR_OFFSET   = 17502608,
        B_DOOR_OFFSET   = 17502616,
        Y_LITH_OFFSET   = 17502624,
        B_LITH_OFFSET   = 17502634,
        TREASURE_COFFER = 17502699,
    },
}

return zones[dsp.zone.VELUGANNON_PALACE]