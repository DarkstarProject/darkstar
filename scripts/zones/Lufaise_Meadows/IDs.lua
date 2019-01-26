-----------------------------------
-- Area: Lufaise_Meadows
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.LUFAISE_MEADOWS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED     = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6388, -- Obtained: <item>.
        GIL_OBTAINED                = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE               = 7049, -- Tallying conquest results...
        CONQUEST                    = 7217, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET      = 7551, -- You can't fish here.
        KI_STOLEN                   = 7680, -- The <keyitem> has been stolen!
        LOGGING_IS_POSSIBLE_HERE    = 7728, -- Logging is possible here if you have <item>.
        SURVEY_THE_SURROUNDINGS     = 7735, -- You survey the surroundings but see nothing out of the ordinary.
        MURDEROUS_PRESENCE          = 7736, -- Wait, you sense a murderous presence...!
        YOU_CAN_SEE_FOR_MALMS       = 7737, -- You can see for malms in every direction.
        SPINE_CHILLING_PRESENCE     = 7739, -- You sense a spine-chilling presence!
    },
    mob =
    {
        PADFOOT               =
        {
            16875552, -- !pos -43.689 0.487 -328.028
            16875578, -- !pos 260.445 -1.761 -27.862
            16875615, -- !pos 412.447 -0.057 -200.161
            16875703, -- !pos -378.950 -15.742 144.215
            16875748, -- !pos -141.523 -15.529 91.709
        },
        MEGALOBUGARD_PH       =
        {
            [16875720] = 16875741, -- -137.168 -15.390 91.016
        },
        LESHY_OFFSET          = 16875754,
        COLORFUL_LESHY        = 16875762,
        SPLINTERSPINE_GRUKJUK = 16875774,
        KURREA                = 16875778,
        AMALTHEIA             = 16875779,
    },
    npc =
    {
        OVERSEER_BASE = 16875865,
        LOGGING       =
        {
            16875883,
            16875884,
            16875885,
            16875886,
            16875887,
            16875888,
        },
    },
}

return zones[dsp.zone.LUFAISE_MEADOWS]