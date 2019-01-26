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
        ITEM_CANNOT_BE_OBTAINED     = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6388, -- Obtained: <item>.
        GIL_OBTAINED                = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE               = 7049, -- Tallying conquest results...
        BEASTMEN_BANNER             = 7130, -- There is a beastmen's banner.
        CONQUEST                    = 7217, -- You've earned conquest points!
        FISHING_MESSAGE_OFFSET      = 7550, -- You can't fish here.
        DIG_THROW_AWAY              = 7563, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                = 7565, -- You dig and you dig, but find nothing.
        FLOWER_BLOOMING             = 7656, -- A large flower is blooming.
        FOUND_NOTHING_IN_FLOWER     = 7659, -- You find nothing inside the flower.
        FEEL_DIZZY                  = 7660, -- You feel slightly dizzy. You must have breathed in too much of the pollen.
        SOMETHING_BETTER            = 7673, -- Don't you have something better to do right now?
        CANNOT_REMOVE_FRAG          = 7676, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG       = 7677, -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS      = 7678, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS             = 7679, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT             = 7680, -- It is an ancient Zilart monument.
        LOGGING_IS_POSSIBLE_HERE    = 7697, -- Logging is possible here if you have <item>.
        HARVESTING_IS_POSSIBLE_HERE = 7704, -- Harvesting is possible here if you have <item>.
        REGIME_REGISTERED           = 10051, -- New training regime registered!
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
        BLUE_RAFFLESIA_OFFSET = 17281585,
        OVERSEER_BASE         = 17281599,
        CERMET_HEADSTONE      = 17281624,
        HARVESTING =
        {
            17281635,
            17281636,
            17281637,
        },
        LOGGING =
        {
            17281629,
            17281630,
            17281631,
            17281632,
            17281633,
            17281634,
        },
    },
}

return zones[dsp.zone.YUHTUNGA_JUNGLE]