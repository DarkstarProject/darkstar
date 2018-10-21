-----------------------------------
-- Area: Den_of_Rancor
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DEN_OF_RANCOR] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        LANTERN_OFFSET          = 7207, -- The grating will not budge.
        FISHING_MESSAGE_OFFSET  = 7235, -- You can't fish here.
        CHEST_UNLOCKED          = 7342, -- You unlock the chest!
        CHEST_FAIL              = 7343, -- <name> fails to open the chest.
        CHEST_TRAP              = 7344, -- The chest was trapped!
        CHEST_WEAK              = 7345, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7346, -- The chest was a mimic!
        CHEST_MOOGLE            = 7347, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7348, -- The chest was but an illusion...
        CHEST_LOCKED            = 7349, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
        SENSE_OMINOUS_PRESENCE  = 7352, -- You sense an ominous presence...
        REGIME_REGISTERED       = 9485, -- New training regime registered!
        HOMEPOINT_SET           = 10535, -- Home point set!
    },
    mob =
    {
        HAKUTAKU    = 17433005,
        MOKUMOKUREN = 17433006,
    },
    npc =
    {
        MIMIC                  = 17432583,
        RANCOR_LANTERN_OFFSET  = 17433047,
        RANCOR_DROP_GATE       = 17433051,
        RANCOR_TREASURE_COFFER = 17433077,
    },
}

return zones[dsp.zone.DEN_OF_RANCOR]