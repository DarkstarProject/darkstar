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
        NOTHING_HAPPENS                = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED        = 6395, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                  = 6401, -- Obtained: <item>.
        GIL_OBTAINED                   = 6402, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6404, -- Obtained key item: <keyitem>.
        KEYITEM_LOST                   = 6405, -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY        = 6415, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                  = 7062, -- Tallying conquest results...
        BEASTMEN_BANNER                = 7141, -- There was a curse on the beastmen's banner!
        ALREADY_OBTAINED_TELE          = 7371, -- You already possess the gate crystal for this telepoint.
        CONQUEST                       = 7384, -- You've earned conquest points!
        ONLY_SHARDS                    = 7717, -- Only shards of ice lie upon the ground.
        BLOCKS_OF_ICE                  = 7718, -- You can hear blocks of ice moving from deep within the cave.
        PERENNIAL_SNOW_DEFAULT         = 7719, -- How many millennia has this snow been here, hidden from the rays of the sun?
        PERENNIAL_SNOW_WAIT            = 7721, -- The <keyitem> you buried is not yet purified.
        YOU_CANNOT_ENTER_DYNAMIS       = 7848, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 7850, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        UNUSUAL_ARRANGEMENT_OF_PEBBLES = 7861, -- There is an unusual arrangement of pebbles here.
        REGIME_REGISTERED              = 10351, -- New training regime registered!
    },
    mob =
    {
        BARBARIC_WEAPON_PH =
        {
            [17236026] = 17236027,
        },
        TIMEWORN_WARRIOR_PH =
        {
            [17236041] = 17236045,
            [17236042] = 17236045,
            [17236043] = 17236045,
            [17236044] = 17236045,
            [17236046] = 17236045,
            [17236047] = 17236045,
            [17236048] = 17236045,
            [17236049] = 17236045,
        },
        SHADOW_EYE_PH =
        {
            [17236149] = 17236180, -- -223.872 -11.784 80.972
            [17236174] = 17236180, -- -254.799 -15.003 -8.120
            [17236175] = 17236180, -- -240.218 -12.523 42.568
            [17236176] = 17236180, -- -245.251 -11.741 106.221
            [17236177] = 17236180, -- -217.075 -8.306 51.115
            [17236178] = 17236180, -- -234.354 -11.492 63.501
        },
        CHAOS_ELEMENTAL = 17236201,
        BOREAL_HOUND    = 17236202,
        BOREAL_COEURL   = 17236203,
        BOREAL_TIGER    = 17236204,
        KOENIGSTIGER    = 17236205,
    },
    npc =
    {
        OVERSEER_BASE      = 17236289,
        BOREAL_TIGER_QM    = 17236307,
        BOREAL_COEURL_QM   = 17236308,
        BOREAL_HOUND_QM    = 17236309,
    },
}

return zones[dsp.zone.XARCABARD]