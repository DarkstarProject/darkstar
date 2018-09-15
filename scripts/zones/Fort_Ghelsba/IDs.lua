-----------------------------------
-- Area: Fort_Ghelsba
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.FORT_GHELSBA] =
{
    text =
    {
        CONQUEST_BASE           = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6546, -- Obtained: <item>.
        GIL_OBTAINED            = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6549, -- Obtained key item: <keyitem>.
        CHEST_UNLOCKED          = 7353, -- You unlock the chest!
        CHEST_FAIL              = 7354, -- <name> fails to open the chest.
        CHEST_TRAP              = 7355, -- The chest was trapped!
        CHEST_WEAK              = 7356, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7357, -- The chest was a mimic!
        CHEST_MOOGLE            = 7358, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7359, -- The chest was but an illusion...
        CHEST_LOCKED            = 7360, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
    },
    mob =
    {
        ORCISH_PANZER = 17354894,
    },
    npc =
    {
        FORT_GHELSBA_TREASURE_CHEST = 17355012,
    },
}

return zones[dsp.zone.FORT_GHELSBA]