-----------------------------------
-- Area: The_Sanctuary_of_ZiTah
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_SANCTUARY_OF_ZITAH] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED             = 6396, -- You obtain <number> <item>!
        NOTHING_OUT_OF_ORDINARY    = 6401, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING        = 6402, -- You are suddenly overcome with a sense of foreboding...
        CONQUEST_BASE              = 7048, -- Tallying conquest results...
        BEASTMEN_BANNER            = 7129, -- There is a beastmen's banner.
        CONQUEST                   = 7216, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET     = 7549, -- You can't fish here.
        DIG_THROW_AWAY             = 7562, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING               = 7564, -- You dig and you dig, but find nothing.
        SOMETHING_BETTER           = 7732, -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG         = 7735, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG      = 7736, -- You have already obtained this monument's <keyitem>. Try searching for another.
        FOUND_ALL_FRAGS            = 7738, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT            = 7739, -- It is an ancient Zilart monument.
        STURDY_BRANCH              = 7762, -- It is a beautiful, sturdy branch.
        SENSE_OMINOUS_PRESENCE     = 7845, -- You sense an ominous presence...
        REGIME_REGISTERED          = 10265, -- New training regime registered!
    },
    mob =
    {
        NOBLE_MOLD_PH   =
        {
            [17273276] = 17273278, -- -391.184 -0.269 -159.086
            [17273277] = 17273278, -- -378.456 0.425 -162.489
        },
        GUARDIAN_TREANT = 17272838,
        DOOMED_PILGRIMS = 17272839,
        NOBLE_MOLD      = 17273278,
        ISONADE         = 17273285,
        GREENMAN        = 17273295,
    },
    npc =
    {
        OVERSEER_BASE          = 17273363,
        ZITAH_CERMET_HEADSTONE = 17273388,
    },
}

return zones[dsp.zone.THE_SANCTUARY_OF_ZITAH]