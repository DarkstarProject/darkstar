-----------------------------------
-- Area: Caedarva_Mire
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CAEDARVA_MIRE] =
{
    text =
    {
        NOTHING_HAPPENS          = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6387, -- Obtained: <item>.
        GIL_OBTAINED             = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET   = 7048, -- You can't fish here.
        RESPONSE                 = 7328, -- There is no response...
        LOGGING_IS_POSSIBLE_HERE = 7342, -- Logging is possible here if you have <item>.
        CANNOT_ENTER             = 7462, -- You cannot enter at this time. Please wait a while before trying again.
        AREA_FULL                = 7463, -- This area is fully occupied. You were unable to enter.
        MEMBER_NO_REQS           = 7467, -- Not all of your party members meet the requirements for this objective. Unable to enter area.
        MEMBER_TOO_FAR           = 7471, -- One or more party members are too far away from the entrance. Unable to enter area.
        JAZARAATS_HEADSTONE      = 7523, -- The name Sir Jazaraat is engraved on the headstone...
        SEAPRINCES_TOMBSTONE     = 8047, -- It appears to be the grave of a great soul to an age long past.
        HOMEPOINT_SET            = 8973, -- Home point set!
    },
    mob =
    {
        AYNU_KAYSEY           = 17101099,
        CAEDARVA_TOAD         = 17101145,
        JAZARAAT              = 17101146,
        LAMIA_NO27            = 17101148,
        MOSHDAHN              = 17101149,
        KHIMAIRA              = 17101201,
        VERDELET              = 17101202,
        TYGER                 = 17101203,
        MAHJLAEF_THE_PAINTORN = 17101204,
        EXPERIMENTAL_LAMIA    = 17101205,
    },
    npc =
    {
        LOGGING =
        {
            17101318,
            17101319,
            17101320,
            17101321,
            17101322,
            17101323,
        },
    },
}

return zones[dsp.zone.CAEDARVA_MIRE]