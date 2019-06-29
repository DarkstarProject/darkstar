-----------------------------------
-- Area: Ranguemont Pass (166)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.RANGUEMONT_PASS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6388, -- Obtained: <item>.
        GIL_OBTAINED                  = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY       = 6402, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING           = 6403, -- You are suddenly overcome with a sense of foreboding...
        YOUR_GEOMAGNETRON_HAS_ATTUNED = 7010, -- Your <Geomagnetron> has been attuned.
        A_FAINT_ENERGY_WAFTS_UP       = 7011, -- A faint energy wafts up from the ground
        YOUR_GEOMAGNETRON_HAS_ALREADY = 7012, -- Your Geomagnetron has already been attuned.
        CONQUEST_BASE                 = 7049, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET        = 7208, -- You can't fish here.
        REGIME_REGISTERED             = 9518, -- New training regime registered!
    },
    mob =
    {
        GLOOM_EYE_PH =
        {
            [17457200] = 17457204,
        },
        TAISAIJIN_PH =
        {
            17457213, -- -18.325 1.830 -114.932
            17457214, -- -5.188 11.730 -141.503
            17457215, -- 59.15 -120 50
        },
        TAISAIJIN    = 17457216,
        TROS         = 17457309,
    },
    npc =
    {
    },
}

return zones[dsp.zone.RANGUEMONT_PASS]