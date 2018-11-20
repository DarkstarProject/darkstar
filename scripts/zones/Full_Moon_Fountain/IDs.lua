-----------------------------------
-- Area: Full_Moon_Fountain
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.FULL_MOON_FOUNTAIN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        UNABLE_TO_PROTECT       = 7366, -- You were unable to protect Ajido-Marujido. Now leaving the battlefield.
        PLAY_TIME_IS_OVER       = 7751, -- Play time is over! Powers of dark mana, answer my call!
        YOU_SHOULD_BE_THANKFUL  = 7752, -- You should be thankful. I'll give you a shortaru trip back to the hell you came from!
        DONT_GIVE_UP            = 7753, -- Don't give up, adventurer! You are Windurst's guiding star, our beacon of hope!
    },
    mob =
    {
        MOON_READING_OFFSET = 17473540,
    },
    npc =
    {
    },
}

return zones[dsp.zone.FULL_MOON_FOUNTAIN]