-----------------------------------
-- Area: Eastern_Altepa_Desert
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.EASTERN_ALTEPA_DESERT] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING     = 6402, -- You are suddenly overcome with a sense of foreboding...
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        BEASTMEN_BANNER         = 7129, -- There is a beastmen's banner.
        CONQUEST                = 7216, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET  = 7549, -- You can't fish here.
        DIG_THROW_AWAY          = 7562, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING            = 7564, -- You dig and you dig, but find nothing.
        ALREADY_OBTAINED_TELE   = 7658, -- You already possess the gate crystal for this telepoint.
        REGIME_REGISTERED       = 9947, -- New training regime registered!
    },
    mob =
    {
        DUNE_WIDOW_PH     =
        {
            [17244395] = 17244396, -- -85.000 2.952 -46.000
            [17244387] = 17244396, -- -38.000 -7.000 -35.000
            [17244281] = 17244396, -- -75.000 -7.000 -1.000
            [17244413] = 17244396, -- -36.319 -16.343 127.472
            [17244436] = 17244396, -- -129.646 -10.544 106.096
            [17244397] = 17244396, -- -110.259 -11.813 54.668
            [17244406] = 17244396, -- -63.693 -15.468 37.550
        },
        CENTURIO_XII_I    = 17244372,
        DECURIO_I_III     = 17244523,
        TSUCHIGUMO_OFFSET = 17244524,
        CACTROT_RAPIDO    = 17244539,
    },
    npc =
    {
        OVERSEER_BASE = 17244625,
    },
}

return zones[dsp.zone.EASTERN_ALTEPA_DESERT]