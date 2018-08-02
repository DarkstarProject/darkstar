-----------------------------------
-- Area: Wajaom_Woodlands
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.WAJAOM_WOODLANDS] =
{
    text =
    {
        NOTHING_HAPPENS             = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET      = 7048, -- You can't fish here.
        DIG_THROW_AWAY              = 7061, -- You dig up ?Possible Special Code: 01??Possible Special Code: 01??Possible Special Code: 01? ?Possible Special Code: 01??Possible Special Code: 05?$?BAD CHAR: 8280??BAD CHAR: 80??BAD CHAR: 80?, but your inventory is full.
        FIND_NOTHING                = 7063, -- You dig and you dig, but find nothing.
        PLACE_HYDROGAUGE            = 7341, -- You set the # in the glowing trench.
        ENIGMATIC_LIGHT             = 7342, -- is giving off an enigmatic light.
        LEYPOINT                    = 7397, -- An eerie red glow emanates from this stone platform
        HARVESTING_IS_POSSIBLE_HERE = 7405, -- Harvesting is possible here if you have
    },
    mob =
    {
        ZORAAL_JA_S_PKUUCHA_PH = 
        {
            [16986191] = 16986197, -- 181.000 -18.000 -63.000
            [16986192] = 16986197, -- 181.000 -19.000 -77.000
            [16986193] = 16986197, -- 195.000 -18.000 -95.000
            [16986194] = 16986197, -- 220.000 -19.000 -80.000
            [16986195] = 16986197, -- 219.000 -18.000 -59.000
            [16986196] = 16986197, -- 203.000 -16.000 -74.000
        },
        ZORAAL_JA_S_PKUUCHA    = 16986197,
        PERCIPIENT_ZORAAL_JA   = 16986198,
        VULPANGUE              = 16986428,
        IRIZ_IMA               = 16986429,
        GOTOH_ZHA_THE_REDOLENT = 16986430,
        TINNIN                 = 16986431,
    },
    npc =
    {
    },
}

return zones[dsp.zone.WAJAOM_WOODLANDS]