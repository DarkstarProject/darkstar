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
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        KEYITEM_LOST            = 6392, -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING     = 6403, -- You are suddenly overcome with a sense of foreboding...
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        BEASTMEN_BANNER         = 7130, -- There is a beastmen's banner.
        CONQUEST                = 7217, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET  = 7550, -- You can't fish here.
        DIG_THROW_AWAY          = 7563, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING            = 7565, -- You dig and you dig, but find nothing.
        ALREADY_OBTAINED_TELE   = 7659, -- You already possess the gate crystal for this telepoint.
        REGIME_REGISTERED       = 9950, -- New training regime registered!
    },
    mob =
    {
        DUNE_WIDOW_PH     =
        {
            [17244395] = 17244396,
        },
        DONNERGUGI_PH     =
        {
            [17244258] = 17244268,
            [17244263] = 17244268,
        },
        CENTURIO_XII_I    = 17244372,
        NANDI             = 17244471,
        DECURIO_I_III     = 17244523,
        TSUCHIGUMO_OFFSET = 17244524,
        CACTROT_RAPIDO    = 17244539,
    },
    npc =
    {
        OVERSEER_BASE = 17244626,
    },
}

return zones[dsp.zone.EASTERN_ALTEPA_DESERT]