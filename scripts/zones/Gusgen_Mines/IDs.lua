-----------------------------------
-- Area: Gusgen_Mines
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GUSGEN_MINES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7207, -- You can't fish here.
        DEVICE_NOT_WORKING      = 7321, -- The device is not working.
        SYS_OVERLOAD            = 7330, -- arning! Sys...verload! Enterin...fety mode. ID eras...d
        YOU_LOST_THE            = 7335, -- You lost the #.
        LOCK_OTHER_DEVICE       = 7338, -- This entrance's lock is connected to some other device.
        MINING_IS_POSSIBLE_HERE = 7358, -- Mining is possible here if you have
        CHEST_UNLOCKED          = 7372, -- You unlock the chest!
        CHEST_FAIL              = 7373, -- Fails to open the chest.
        CHEST_TRAP              = 7374, -- The chest was trapped!
        CHEST_WEAK              = 7375, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7376, -- The chest was a mimic!
        CHEST_MOOGLE            = 7377, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7378, -- The chest was but an illusion...
        CHEST_LOCKED            = 7379, -- The chest appears to be locked.
        LETTERS_IS_WRITTEN_HERE = 7380, -- Something resembling letters is written here.
        FOUND_LOCATION_SEAL     = 7381, -- You have found the location of the seal. You placeon it.
        IS_ON_THIS_SEAL         = 7382, -- is on this seal.
        NOTHING_OUT_OF_ORDINARY = 7402, -- There is nothing out of the ordinary here.
    },
    mob =
    {
        BLIND_MOBY      = 17580038,
        WANDERING_GHOST = 17580337,
    },
    npc =
    {
        GUSGEN_TREASURE_CHEST = 17580403,
    },
}

return zones[dsp.zone.GUSGEN_MINES]