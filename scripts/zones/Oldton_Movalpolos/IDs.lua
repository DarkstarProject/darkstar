-----------------------------------
-- Area: Oldton_Movalpolos
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.OLDTON_MOVALPOLOS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7567, -- You can't fish here.
        MINING_IS_POSSIBLE_HERE = 7698, -- Mining is possible here if you have <item>.
        RAKOROK_DIALOGUE        = 7722, -- Nsy pipul. Gattohre! I bisynw!
        CHEST_UNLOCKED          = 7745, -- You unlock the chest!
        CHEST_FAIL              = 7746, -- <name> fails to open the chest.
        CHEST_TRAP              = 7747, -- The chest was trapped!
        CHEST_WEAK              = 7748, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7749, -- The chest was a mimic!
        CHEST_MOOGLE            = 7750, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7751, -- The chest was but an illusion...
        CHEST_LOCKED            = 7752, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
    },
    mob =
    {
        GOBLIN_WOLFMAN        = 16822459,
        OVERSEER_BASE         = 16822509,
        OLDTON_TREASURE_CHEST = 16822531,
    },
    npc =
    {
        MINING =
        {
            16822525,
            16822526,
            16822527,
            16822528,
            16822529,
            16822530,
        },
    },
}

return zones[dsp.zone.OLDTON_MOVALPOLOS]