-----------------------------------
-- Area: PsoXja
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PSOXJA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        CONQUEST_BASE           = 7070, -- Tallying conquest results...
        DEVICE_IN_OPERATION     = 7229, -- The device appears to be in operation...
        NOTHING_OUT_OF_ORDINARY = 7231, -- There is nothing out of the ordinary here.
        DOOR_LOCKED             = 7232, -- The door is locked.
        ARCH_GLOW_BLUE          = 7233, -- The arch above the door is glowing blue...
        ARCH_GLOW_GREEN         = 7234, -- The arch above the door is glowing green...
        CANNOT_OPEN_SIDE        = 7237, -- The door cannot be opened from this side.
        TRAP_FAILS              = 7240, -- The trap connected to it fails to activate.
        DISCOVER_DISARM_FAIL    = 7241, -- discovers a trap connected to the door, but fails to disarm it!
        DISCOVER_DISARM_SUCCESS = 7242, -- discovers a trap connected to the door and succeeds in disarming it!
        TRAP_ACTIVATED          = 7244, -- A trap connected to it has been activated!
        CHEST_UNLOCKED          = 7461, -- You unlock the chest!
        CHEST_FAIL              = 7462, -- Fails to open the chest.
        CHEST_TRAP              = 7463, -- The chest was trapped!
        CHEST_WEAK              = 7464, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7465, -- The chest was a mimic!
        CHEST_MOOGLE            = 7466, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7467, -- The chest was but an illusion...
        CHEST_LOCKED            = 7468, -- The chest appears to be locked.
        BROKEN_KNIFE            = 7469, -- A broken knife blade can be seen among the rubble...
        HOMEPOINT_SET           = 7474, -- Home point set!
    },
    mob =
    {
        GARGOYLE_OFFSET         = 16814081,
        NUNYUNUWI               = 16814361,
        GOLDEN_TONGUED_CULBERRY = 16814432,
    },
    npc =
    {
        GOLDEN_TONGUED_CULBERRY_QM = 16814434,
        STONE_DOOR_OFFSET          = 16814445,
        PSO_XJA_TREASURE_CHEST     = 16814557,
    },
}

return zones[dsp.zone.PSOXJA]