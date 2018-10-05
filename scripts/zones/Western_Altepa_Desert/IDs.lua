-----------------------------------
-- Area: Western_Altepa_Desert
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.WESTERN_ALTEPA_DESERT] =
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
        CONQUEST_BASE              = 7048, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET     = 7207, -- You can't fish here.
        DIG_THROW_AWAY             = 7220, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING               = 7222, -- You dig and you dig, but find nothing.
        THE_DOOR_IS_LOCKED         = 7327, -- The door is locked.
        DOES_NOT_RESPOND           = 7328, -- It does not respond.
        CANNOT_REMOVE_FRAG         = 7344, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG      = 7345, -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS     = 7346, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS            = 7347, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT            = 7348, -- It is an ancient Zilart monument.
        SENSE_OMINOUS_PRESENCE     = 7392, -- You sense an ominous presence...
        REGIME_REGISTERED          = 9809, -- New training regime registered!
    },
    mob =
    {
        CACTUAR_CANTAUTOR_PH =
        {
            [17289559] = 17289560, -- -458.944 0.018 -557.266
            [17289578] = 17289560, -- -478.142 -0.457 -596.091
        },
        CELPHIE_PH           =
        {
            [17289473] = 17289453, -- 78.226 -0.497 69.745
            [17289450] = 17289453, -- 57.256 0.116 13.972
            [17289451] = 17289453, -- 70.263 0.130 -23.484
            [17289452] = 17289453, -- 50.014 0.256 7.088
            [17289407] = 17289453, -- 10.439 -0.280 -80.476
            [17289406] = 17289453, -- 35.924 0.087 -98.228
            [17289474] = 17289453, -- 118.575 -0.299 127.016
            [17289277] = 17289453, -- 99.000 -0.030 116.000
        },
        KING_VINEGARROON     = 17289575,
        SABOTENDER_ENAMORADO = 17289653,
        EASTERN_SPHINX       = 17289654,
        WESTERN_SPHINX       = 17289655,
        MAHARAJA             = 17289656,
    },
    npc =
    {
    },
}

return zones[dsp.zone.WESTERN_ALTEPA_DESERT]