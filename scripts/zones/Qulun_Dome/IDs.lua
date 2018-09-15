-----------------------------------
-- Area: Qulun_Dome
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.QULUN_DOME] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED                 = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                           = 6387, -- Obtained: <item>.
        GIL_OBTAINED                            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED                        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY                 = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE                           = 7048, -- Tallying conquest results...
        IT_SEEMS_TO_BE_LOCKED_BY_POWERFUL_MAGIC = 7207, -- A door... It seems to be locked by powerful magic.
        THE_3_ITEMS_GLOW_FAINTLY                = 7208, -- The <item>, <item>, and <item> glow faintly.
        CANNOT_BE_OPENED_FROM_THIS_SIDE         = 7212, -- It cannot be opened from this side!
        THE_MAGICITE_GLOWS_OMINOUSLY            = 7250, -- The magicite glows ominously.
        YOU_FIND_NOTHING                        = 7251, -- You find nothing.
        DIAMOND_QUADAV_ENGAGE                   = 7252, -- Gwa-ha-ha, puny peoples! Ou-ur king never forge-ets a gru-udge. He'll gri-ind you into pa-aste!
        DIAMOND_QUADAV_DEATH                    = 7253, -- Glo-ory to the Adamantking!
        QUADAV_KING_ENGAGE                      = 7254, -- Childre-en of Altana? I will ba-athe in your blood as I did at the Ba-attle of Jeuno!
        QUADAV_KING_DEATH                       = 7255, -- I a-am fini-ished. Hear me, wa-arriors of the Quadav! The throne of the Adamantking and the line of Za'Dha pa-asses to my bro-other...
    },
    mob =
    {
        DIAMOND_QUADAV             = 17383442,
        AFFABLE_ADAMANTKING_OFFSET = 17383444,
    },
    npc =
    {
    },
}

return zones[dsp.zone.QULUN_DOME]