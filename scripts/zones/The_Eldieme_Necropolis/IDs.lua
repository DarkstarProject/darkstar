-----------------------------------
-- Area: The_Eldieme_Necropolis
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_ELDIEME_NECROPOLIS] =
{
    text =
    {
        CONQUEST_BASE                           = 0,    -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED                 = 6541, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                           = 6547, -- Obtained: <item>.
        GIL_OBTAINED                            = 6548, -- Obtained <number> gil.
        KEYITEM_OBTAINED                        = 6550, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY                 = 6561, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING                     = 6562, -- You are suddenly overcome with a sense of foreboding...
        DEVICE_NOT_WORKING                      = 7318, -- The device is not working.
        SYS_OVERLOAD                            = 7327, -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE                            = 7332, -- You lost the <item>.
        NOTHING_HAPPENED                        = 7342, -- Nothing happened...
        RETURN_RIBBON_TO_HER                    = 7355, -- You can hear a voice from somewhere. (...return...ribbon to...her...)
        THE_BRAZIER_IS_LIT                      = 7369, -- The brazier is lit.
        REFUSE_TO_LIGHT                         = 7370, -- Unexpectedly, the <item> refuses to light.
        LANTERN_GOES_OUT                        = 7371, -- For some strange reason, the light of the <item> goes out...
        THE_LIGHT_DIMLY                         = 7372, -- The <item> lights dimly. It doesn't look like this will be effective yet.
        THE_LIGHT_HAS_INTENSIFIED               = 7373, -- The light of the <item> has intensified.
        THE_LIGHT_IS_FULLY_LIT                  = 7374, -- The <item> is fully lit!
        SOLID_STONE                             = 7382, -- This door is made of solid stone.
        CHEST_UNLOCKED                          = 7402, -- You unlock the chest!
        SPIRIT_INCENSE_EMITS_PUTRID_ODOR        = 7412, -- The <item> emits a putrid odor and burns up. Your attempt this time has failed...
        SARCOPHAGUS_CANNOT_BE_OPENED            = 7429, -- It is a stone sarcophagus with the lid sealed tight. It cannot be opened.
        REGIME_REGISTERED                       = 9674, -- New training regime registered!
    },
    mob =
    {
        CWN_CYRFF_PH  =
        {
            [17576050] = 17576054, -- -375.862 0.542 382.17
            [17576051] = 17576054, -- -399.941 0.027 379.055
            [17576052] = 17576054, -- -384.019 0.509 384.26
            [17576053] = 17576054, -- -376.974 0.586 343.750
        },
        LICH_C_MAGNUS = 17575937,
        YUM_KIMIL     = 17576264,
        STURM         = 17576267,
        TAIFUN        = 17576268,
        TROMBE        = 17576269,
        MIMIC         = 17576270,
    },
    npc =
    {
        GATE_OFFSET        = 17576306,
        BRAZIER_OFFSET     = 17576343,
        TREASURE_CHEST     = 17576356,
        TREASURE_COFFER    = 17576357,
        SARCOPHAGUS_OFFSET = 17576394,
    },
}

return zones[dsp.zone.THE_ELDIEME_NECROPOLIS]