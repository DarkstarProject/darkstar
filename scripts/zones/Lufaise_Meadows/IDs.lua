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
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE               = 7048, -- Tallying conquest results...
        CONQUEST                    = 7216, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET      = 7550, -- You can't fish here.
        NOTHING_OUT_OF_THE_ORDINARY = 7650, -- There is nothing out of the ordinary here.
        KI_STOLEN                   = 7679, -- The ?Possible Special Code: 01??Possible Special Code: 05?3??BAD CHAR: 80??BAD CHAR: 80? has been stolen!
        LOGGING_IS_POSSIBLE_HERE    = 7727, -- Logging is possible here if you have
        SURVEY_THE_SURROUNDINGS     = 7734, -- You survey the surroundings but see nothing out of the ordinary.
        MURDEROUS_PRESENCE          = 7735, -- Wait, you sense a murderous presence...!
        YOU_CAN_SEE_FOR_MALMS       = 7736, -- You can see for malms in every direction.
        SPINE_CHILLING_PRESENCE     = 7738, -- You sense a spine-chilling presence!
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
        LESHY_OFFSET          = 16875754,
        COLORFUL_LESHY        = 16875762,
        SPLINTERSPINE_GRUKJUK = 16875774,
        KURREA                = 16875778,
        AMALTHEIA             = 16875779,
        OVERSEER_BASE         = 16875865,
        KURREA_QM             = 16875890,
        AMALTHEIA_QM          = 16875894,
    },
    npc =
    {
    },
}

return zones[dsp.zone.LUFAISE_MEADOWS]