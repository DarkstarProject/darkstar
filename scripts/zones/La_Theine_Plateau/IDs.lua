-----------------------------------
-- Area: La_Theine_Plateau
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.LA_THEINE_PLATEAU] =
{
    text =
    {
        NOTHING_HAPPENS              = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED      = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6388, -- Obtained: <item>.
        GIL_OBTAINED                 = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                = 7049, -- Tallying conquest results...
        ALREADY_OBTAINED_TELE        = 7208, -- You already possess the gate crystal for this telepoint.
        FISHING_MESSAGE_OFFSET       = 7212, -- You can't fish here.
        DIG_THROW_AWAY               = 7225, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                 = 7227, -- You dig and you dig, but find nothing.
        RESCUE_DRILL                 = 7384, -- Rescue drills in progress. Try to stay out of the way.
        FAURBELLANT_1                = 7424, -- Greetings. traveler. Sorry, I've little time to chat. I must focus on my prayer.
        FAURBELLANT_2                = 7425, -- Ah, the <item>! Thank you for making such a long journey to bring this! May the Gates of Paradise open to all.
        FAURBELLANT_3                = 7426, -- Please deliver that <item> to the high priest in the San d'Oria Cathedral.
        FAURBELLANT_4                = 7427, -- My thanks again for your services. May the Gates of Paradise open to all.
        UNLOCK_SUMMONER              = 7573, -- You can now become a summoner.
        UNLOCK_CARBUNCLE             = 7574, -- You can now summon Carbuncle.
        CANNOT_REMOVE_FRAG           = 7588, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG        = 7589, -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS       = 7590, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS              = 7591, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT              = 7592, -- It is an ancient Zilart monument.
        TELEPOINT_HAS_BEEN_SHATTERED = 7753, -- The telepoint has been shattered into a thousand pieces...
        BROKEN_EGG                   = 7824, -- There is a broken egg on the ground here. Perhaps there is a nest in the boughs of this tree.
        CHOCOBO_TRACKS               = 7885, -- There are chocobo tracks on the ground here.
        REGIME_REGISTERED            = 10123, -- New training regime registered!
    },
    mob =
    {
        TUMBLING_TRUFFLE_PH =
        {
            [17195256] = 17195259, -- 450.472 70.657 238.237
        },
        LUMBERING_LAMBERT_PH =
        {
            [17195143] = 17195317, -- -372 -16 -6
            [17195316] = 17195317, -- -117 -1 -136
            [17195317] = 17195318, -- Lumbering can't spawn if Bloodtear is up
        },
        BLOODTEAR_PH =
        {
            [17195143] = 17195318, -- -372 -16 -6
            [17195316] = 17195318, -- -117 -1 -136
            [17195317] = 17195318, -- -216 -8 -107
            [17195318] = 17195317, -- Bloodtear can't spawn if Lumbering is up
        },
        NIHNIKNOOVI    = 17195475,
    },
    npc =
    {
        FALLEN_EGG = 17195582,
        RAINBOW    = 17195606,
    },
}

return zones[dsp.zone.LA_THEINE_PLATEAU]