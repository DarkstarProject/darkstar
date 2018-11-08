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
    },
    mob =
    {
        GOBLIN_WOLFMAN        = 16822459,
    },
    npc =
    {
        OVERSEER_BASE  = 16822509,
        TREASURE_CHEST = 16822531,
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