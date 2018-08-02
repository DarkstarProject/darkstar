-----------------------------------
-- Area: Xarcabard
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.XARCABARD] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED        = 6394, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6400, -- Obtained: <item>.
        GIL_OBTAINED                   = 6401, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6403, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                  = 7061, -- Tallying conquest results...
        BEASTMEN_BANNER                = 7140, -- There was a curse on the beastmen's banner!
        NOTHING_HAPPENS                = 7226, -- Nothing happens...
        NOTHING_OUT_OF_ORDINARY        = 7348, -- There is nothing out of the ordinary here.
        ALREADY_OBTAINED_TELE          = 7370, -- You already possess the gate crystal for this telepoint.
        CONQUEST                       = 7383, -- You've earned conquest points!
        ONLY_SHARDS                    = 7716, -- Only shards of ice lie upon the ground.
        BLOCKS_OF_ICE                  = 7717, -- You can hear blocks of ice moving from deep within the cave.
        PERENNIAL_SNOW_DEFAULT         = 7718, -- How many millennia has this snow been here, hidden from the rays of the sun?
        PERENNIAL_SNOW_WAIT            = 7720, -- The <keyitem> you buried is not yet purified.≺Prompt≻
        YOU_CANNOT_ENTER_DYNAMIS       = 7845, -- You cannot enter Dynamis
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7847, -- Players who have not reached levelare prohibited from entering Dynamis
        UNUSUAL_ARRANGEMENT_OF_PEBBLES = 7858, -- There is an unusual arrangement of pebbles here.
    },
    mob =
    {
        CHAOS_ELEMENTAL = 17236201,
        BOREAL_HOUND    = 17236202,
        BOREAL_COEURL   = 17236203,
        BOREAL_TIGER    = 17236204,
        KOENIGSTIGER    = 17236205,
    },
    npc =
    {
        CHAOS_ELEMENTAL_QM = 17236277,
        OVERSEER_BASE      = 17236288,
        BOREAL_TIGER_QM    = 17236306,
        BOREAL_COEURL_QM   = 17236307,
        BOREAL_HOUND_QM    = 17236308,
    },
}

return zones[dsp.zone.XARCABARD]