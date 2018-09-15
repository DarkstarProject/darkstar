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
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_HERE        = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        DOOR_SEALED_SHUT        = 7210, -- The door above you is sealed shut.
        DOOR_LOCKED             = 7212, -- The door is locked.  You might be able to open it with <item>.
        LAMP_OFFSET             = 7218, -- A symbol for fire is engraved on the base of the lamp...
        FISHING_MESSAGE_OFFSET  = 7231, -- You can't fish here.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.PHOMIUNA_AQUEDUCTS]