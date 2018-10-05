-----------------------------------
-- Area: Ranguemont_Pass
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.RANGUEMONT_PASS] =
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
        FISHING_MESSAGE_OFFSET  = 7207, -- You can't fish here.
        REGIME_REGISTERED       = 9517, -- New training regime registered!
    },
    mob =
    {
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