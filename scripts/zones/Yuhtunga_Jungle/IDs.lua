-----------------------------------
-- Area: Yuhtunga_Jungle
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.YUHTUNGA_JUNGLE] =
{
    text =
    {
        NOTHING_HAPPENS             = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE               = 7048, -- Tallying conquest results...
        BEASTMEN_BANNER             = 7129, -- There is a beastmen's banner.
        CONQUEST                    = 7216, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET      = 7549, -- You can't fish here.
        DIG_THROW_AWAY              = 7562, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                = 7564, -- You dig and you dig, but find nothing.
        FLOWER_BLOOMING             = 7655, -- A large flower is blooming.
        FOUND_NOTHING_IN_FLOWER     = 7658, -- You find nothing inside the flower.
        FEEL_DIZZY                  = 7659, -- You feel slightly dizzy. You must have breathed in too much of the pollen.
        SOMETHING_BETTER            = 7672, -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG          = 7675, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG       = 7676, -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS      = 7677, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS             = 7678, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT             = 7679, -- It is an ancient Zilart monument.
        LOGGING_IS_POSSIBLE_HERE    = 7696, -- Logging is possible here if you have <item>.
        HARVESTING_IS_POSSIBLE_HERE = 7703, -- Harvesting is possible here if you have <item>.
        REGIME_REGISTERED           = 10048, -- New training regime registered!
    },
    mob =
    {
        MISCHIEVOUS_MICHOLAS_PH =
        {
            [17281148] = 17281149, -- -265.616 -0.5 -24.389
        },
        TIPHA                   = 17281030,
        CARTHI                  = 17281031,
        ROSE_GARDEN_PH          = 17281356,
        ROSE_GARDEN             = 17281357,
        VOLUPTUOUS_VILMA        = 17281358,
    },
    npc =
    {
        BLUE_RAFFLESIA_OFFSET     = 17281584,
        OVERSEER_BASE             = 17281598,
        YUHTUNGA_CERMET_HEADSTONE = 17281623,
        HARVESTING =
        {
            17281634,
            17281635,
            17281636,
        },
        LOGGING =
        {
            17281628,
            17281629,
            17281630,
            17281631,
            17281632,
            17281633,
        },
    },
}

return zones[dsp.zone.YUHTUNGA_JUNGLE]