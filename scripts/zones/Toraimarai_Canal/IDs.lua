-----------------------------------
-- Area: Toraimarai_Canal
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.TORAIMARAI_CANAL] =
{
    text =
    {
        SEALED_SHUT             = 3, -- It's sealed shut with incredibly strong magic.
        ITEM_CANNOT_BE_OBTAINED = 6428, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6434, -- Obtained: <item>.
        GIL_OBTAINED            = 6435, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6437, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7095, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7254, -- You can't fish here.
        CHEST_UNLOCKED          = 7362, -- You unlock the chest!
        REGIME_REGISTERED       = 9617, -- New training regime registered!
        HOMEPOINT_SET           = 10693, -- Home point set!
    },
    mob =
    {
        CANAL_MOOCHER_PH =
        {
            [17469575] = 17469578,
            [17469576] = 17469578,
            [17469577] = 17469578,
        },
        KONJAC_PH =
        {
            [17469629] = 17469632,
            [17469630] = 17469632,
            [17469631] = 17469632,
        },
        MAGIC_SLUDGE      = 17469516,
        HINGE_OILS_OFFSET = 17469666,
        MIMIC             = 17469761,
    },
    npc =
    {
        TOME_OF_MAGIC_OFFSET = 17469828,
        TREASURE_COFFER      = 17469835,
    },
}

return zones[dsp.zone.TORAIMARAI_CANAL]