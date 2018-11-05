-----------------------------------
-- Area: Mamook
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MAMOOK] =
{
    text =
    {
        NOTHING_HAPPENS          = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6387, -- Obtained: <item>.
        GIL_OBTAINED             = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET   = 7048, -- You can't fish here.
        LOGGING_IS_POSSIBLE_HERE = 7533, -- Logging is possible here if you have <item>.
    },
    mob =
    {
        GULOOL_JA_JA   = 17043875,
        CHAMROSH       = 17043887,
        IRIRI_SAMARIRI = 17043888,
    },
    npc =
    {
        LOGGING =
        {
            17044014,
            17044015,
            17044016,
            17044017,
            17044018,
            17044019,
        },
    },
}

return zones[dsp.zone.MAMOOK]