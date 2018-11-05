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
        ITEM_CANNOT_BE_OBTAINED      = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6387, -- Obtained: <item>.
        GIL_OBTAINED                 = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                = 7048, -- Tallying conquest results...
        ALREADY_OBTAINED_TELE        = 7207, -- You already possess the gate crystal for this telepoint.
        FISHING_MESSAGE_OFFSET       = 7211, -- You can't fish here.
        DIG_THROW_AWAY               = 7224, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                 = 7226, -- You dig and you dig, but find nothing.
        RESCUE_DRILL                 = 7383, -- Rescue drills in progress. Try to stay out of the way.
        FAURBELLANT_1                = 7423, -- Greetings. traveler. Sorry, I've little time to chat. I must focus on my prayer.
        FAURBELLANT_2                = 7424, -- Ah, the <item>! Thank you for making such a long journey to bring this! May the Gates of Paradise open to all.
        FAURBELLANT_3                = 7425, -- Please deliver that <item> to the high priest in the San d'Oria Cathedral.
        FAURBELLANT_4                = 7426, -- My thanks again for your services. May the Gates of Paradise open to all.
        UNLOCK_SUMMONER              = 7570, -- You can now become a summoner.
        UNLOCK_CARBUNCLE             = 7571, -- You can now summon Carbuncle.
        CANNOT_REMOVE_FRAG           = 7585, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG        = 7586, -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS       = 7587, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS              = 7588, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT              = 7589, -- It is an ancient Zilart monument.
        TELEPOINT_HAS_BEEN_SHATTERED = 7750, -- The telepoint has been shattered into a thousand pieces...
        BROKEN_EGG                   = 7821, -- There is a broken egg on the ground here. Perhaps there is a nest in the boughs of this tree.
        CHOCOBO_TRACKS               = 7882, -- There are chocobo tracks on the ground here.
        REGIME_REGISTERED            = 10120, -- New training regime registered!
    },
    mob =
    {
        TUMBLING_TRUFFLE_PH =
        {
            [17195256] = 17195259, -- 450.472 70.657 238.237
        },
        BATTERING_RAM       = 17195316,
        NIHNIKNOOVI         = 17195475,
    },
    npc =
    {
        FALLEN_EGG        = 17195582,
        LA_THEINE_RAINBOW = 17195606,
    },
}

return zones[dsp.zone.LA_THEINE_PLATEAU]