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
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7208, -- You can't fish here.
        DEVICE_NOT_WORKING      = 7322, -- The device is not working.
        SYS_OVERLOAD            = 7331, -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE            = 7336, -- You lost the <item>.
        LOCK_OTHER_DEVICE       = 7339, -- This entrance's lock is connected to some other device.
        MINING_IS_POSSIBLE_HERE = 7359, -- Mining is possible here if you have <item>.
        CHEST_UNLOCKED          = 7374, -- You unlock the chest!
        LETTERS_IS_WRITTEN_HERE = 7382, -- Something resembling letters is written here.
        FOUND_LOCATION_SEAL     = 7383, -- You have found the location of the seal. You place <item> on it.
        IS_ON_THIS_SEAL         = 7384, -- <item> is on this seal.
        REGIME_REGISTERED       = 10383, -- New training regime registered!
    },
    mob =
    {
        BLIND_MOBY          = 17580038,
        WANDERING_GHOST     = 17580337,
        APPARATUS_ELEMENTAL = 17580340,
    },
    npc =
    {
        TREASURE_CHEST = 17580403,
        MINING =
        {
            17580397,
            17580398,
            17580399,
            17580400,
            17580401,
            17580402,
        },
    },
}

return zones[dsp.zone.GUSGEN_MINES]