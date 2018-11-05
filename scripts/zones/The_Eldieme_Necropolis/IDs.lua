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
        ITEM_CANNOT_BE_OBTAINED                 = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                           = 6546, -- Obtained: <item>.
        GIL_OBTAINED                            = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED                        = 6549, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY                 = 6560, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING                     = 6561, -- You are suddenly overcome with a sense of foreboding...
        DEVICE_NOT_WORKING                      = 7317, -- The device is not working.
        SYS_OVERLOAD                            = 7326, -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE                            = 7331, -- You lost the <item>.
        RETURN_RIBBON_TO_HER                    = 7354, -- You can hear a voice from somewhere. (...return...ribbon to...her...)
        THE_BRAZIER_IS_LIT                      = 7368, -- The brazier is lit.
        REFUSE_TO_LIGHT                         = 7369, -- Unexpectedly, the <item> refuses to light.
        LANTERN_GOES_OUT                        = 7370, -- For some strange reason, the light of the <item> goes out...
        THE_LIGHT_DIMLY                         = 7371, -- The <item> lights dimly. It doesn't look like this will be effective yet.
        THE_LIGHT_HAS_INTENSIFIED               = 7372, -- The light of the <item> has intensified.
        THE_LIGHT_IS_FULLY_LIT                  = 7373, -- The <item> is fully lit!
        SOLID_STONE                             = 7381, -- This door is made of solid stone.
        CHEST_UNLOCKED                          = 7400, -- You unlock the chest!
        SPIRIT_INCENSE_EMITS_PUTRID_ODOR        = 7410, -- The <item> emits a putrid odor and burns up. Your attempt this time has failed...
        SARCOPHAGUS_CANNOT_BE_OPENED            = 7427, -- It is a stone sarcophagus with the lid sealed tight. It cannot be opened.
        NOTHING_HAPPENED                        = 7341, -- Nothing happened...
        REGIME_REGISTERED                       = 9672, -- New training regime registered!
    },
    mob =
    {
        LICH_C_MAGNUS = 17575937,
        YUM_KIMIL     = 17576264,
        DOG_GUARDIAN  = 17576265,
        OWL_GUARDIAN  = 17576266,
        STURM         = 17576267,
        TAIFUN        = 17576268,
        TROMBE        = 17576269,
        MIMIC         = 17576270,
    },
    npc =
    {
        ELDIEME_BRAZIER_OFFSET = 17576343,
        TREASURE_CHEST         = 17576356,
        TREASURE_COFFER        = 17576357,
    },
}

return zones[dsp.zone.THE_ELDIEME_NECROPOLIS]