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
        CHEST_FAIL              = 7215, -- <name> fails to open the chest.
        CHEST_TRAP              = 7216, -- The chest was trapped!
        CHEST_WEAK              = 7217, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7218, -- The chest was a mimic!
        CHEST_MOOGLE            = 7219, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7220, -- The chest was but an illusion...
        CHEST_LOCKED            = 7221, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
        REGIME_REGISTERED       = 10157, -- New training regime registered!
    },
    mob =
    {
        MIMIC            = 17502567,
        BRIGANDISH_BLADE = 17502568,
    },
    npc =
    {
        BRIGANDISH_BLADE_QM        = 17502582,
        VELUGANNON_Y_DOOR_OFFSET   = 17502608,
        VELUGANNON_B_DOOR_OFFSET   = 17502616,
        VELUGANNON_Y_LITH_OFFSET   = 17502624,
        VELUGANNON_B_LITH_OFFSET   = 17502634,
        VELUGANNON_TREASURE_COFFER = 17502699,
    },
}

return zones[dsp.zone.VELUGANNON_PALACE]