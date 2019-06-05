-----------------------------------
-- Area: Dynamis-Valkurm
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_VALKURM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7149, -- Tallying conquest results...
        -- dynamis
        DYNAMIS_TIME_BEGIN = 7312; -- The sands of the <item> have begun to fall.  You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND = 7313; -- Your stay in Dynamis has been extended by <number> minutes.
        DYNAMIS_TIME_UPDATE_1 = 7314; -- You will be expelled from Dynamis in <number> second/minute.
        DYNAMIS_TIME_UPDATE_2 = 7315; -- You will be expelled from Dynamis in <number> seconds/minutes.
        DYNAMIS_TIME_EXPIRED = 7317; -- The sands of the hourglass have emptied...
    },
    mob =
    {
        TE5_RANDOM =
        {
            [1] = 16937500, -- Warchief_Tombstone
            [2] = 16937525, -- Adamantking_Image
            [3] = 16937550, -- Avatar_Idol
            [4] = 16937575, -- Goblin_Statue
        }
    },
    npc =
    {
    },
}

return zones[dsp.zone.DYNAMIS_VALKURM]
