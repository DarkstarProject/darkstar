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
        CHEST_IS_LOCKED         = 7353, -- This chest is locked. It can be opened with <item>.
        CHEST_UNLOCKED          = 7360, -- You unlock the chest!
        CHEST_FAIL              = 7361, -- <name> fails to open the chest.
        CHEST_TRAP              = 7362, -- The chest was trapped!
        CHEST_WEAK              = 7363, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7364, -- The chest was a mimic!
        CHEST_MOOGLE            = 7365, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7366, -- The chest was but an illusion...
        CHEST_LOCKED            = 7367, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
        HOMEPOINT_SET           = 10691, -- Home point set!
    },
    mob =
    {
        MAGIC_SLUDGE      = 17469516,
        HINGE_OILS_OFFSET = 17469666,
    },
    npc =
    {
        TOME_OF_MAGIC_OFFSET       = 17469828,
        TORAIMARAI_TREASURE_COFFER = 17469835,
    },
}

return zones[dsp.zone.TORAIMARAI_CANAL]