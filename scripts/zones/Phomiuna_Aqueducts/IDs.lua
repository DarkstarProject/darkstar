-----------------------------------
-- Area: Phomiuna_Aqueducts
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PHOMIUNA_AQUEDUCTS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_HERE        = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        DOOR_SEALED_SHUT        = 7211, -- The door above you is sealed shut.
        DOOR_LOCKED             = 7213, -- The door is locked.  You might be able to open it with <item>.
        LAMP_OFFSET             = 7219, -- A symbol for fire is engraved on the base of the lamp...
        FISHING_MESSAGE_OFFSET  = 7232, -- You can't fish here.
        COMMON_SENSE_SURVIVAL   = 7408, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.PHOMIUNA_AQUEDUCTS]