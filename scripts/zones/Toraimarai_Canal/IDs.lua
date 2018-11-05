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
        ITEM_CANNOT_BE_OBTAINED = 6427, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6433, -- Obtained: <item>.
        GIL_OBTAINED            = 6434, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6436, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7094, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7253, -- You can't fish here.
        CHEST_UNLOCKED          = 7360, -- You unlock the chest!
        REGIME_REGISTERED       = 9615, -- New training regime registered!
        HOMEPOINT_SET           = 10691, -- Home point set!
    },
    mob =
    {
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