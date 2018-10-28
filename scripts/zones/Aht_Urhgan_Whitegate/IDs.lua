-----------------------------------
-- Area: Aht_Urhgan_Whitegate
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.AHT_URHGAN_WHITEGATE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 218, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_CANNOT_BE_OBTAINEDX      = 222, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                 = 224, -- Obtained: <item>.
        GIL_OBTAINED                  = 225, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 227, -- Obtained key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL           = 229, -- You do not have enough gil.
        FISHING_MESSAGE_OFFSET        = 885, -- You can't fish here.
        MOG_LOCKER_OFFSET             = 1224, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        HOMEPOINT_SET                 = 1365, -- Home point set!
        IMAGE_SUPPORT_ACTIVE          = 1404, -- You have to wait a bit longer before asking for synthesis image support again.
        IMAGE_SUPPORT                 = 1406, -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        ITEM_OBTAINEDX                = 1496, -- You obtain <item>!
        RUNIC_PORTAL                  = 4583, -- You cannot use the runic portal without the Empire's authorization.
        UGRIHD_PURCHASE_DIALOGUE      = 4644, -- Salaheem's Sentinels values your contribution to the success of the company. Please come again!
        HADAHDA_DIALOG                = 4914, -- Hey, think you could help me out?
        MUSHAYRA_DIALOG               = 4963, -- Sorry for all the trouble. Please ignore Hadahda the next time he asks you to do something.
        RYTAAL_MISSION_COMPLETE       = 5651, -- Congratulations. You have been awarded Assault Points for the successful completion of your mission.
        RYTAAL_MISSION_FAILED         = 5652, -- Your mission was not successful; however, the Empire recognizes your contribution and has awarded you Assault Points.
        AUTOMATON_RENAME              = 5829, -- Your automaton has a new name.
        YOU_CAN_BECOME_PUP            = 5832, -- You can now become a puppetmaster!
        NEED_ASTRAL_CANDESCENCE_BACK  = 7683, -- ...Hm? You! Yes, you! What do you think you're staring at, anyway? Go get the Astral Candescence back, and now!
        PAY_DIVINATION                = 8766, -- ou pay 1000 gil for the divination.
        GAVRIE_SHOP_DIALOG            = 9264, -- Remember to take your medicine in small doses... Sometimes you can get a little too much of a good thing!
        MALFUD_SHOP_DIALOG            = 9265, -- Welcome, welcome! Flavor your meals with Malfud's ingredients!
        RUBAHAH_SHOP_DIALOG           = 9266, -- Flour! Flooour! Corn! Rice and beans! Get your rice and beans here! If you're looking for grain, you've come to the right place!
        MULNITH_SHOP_DIALOG           = 9267, -- Drawn in by my shop's irresistible aroma, were you? How would you like some of the Near East's famous skewers to enjoy during your journeys?
        SALUHWA_SHOP_DIALOG           = 9268, -- Looking for undentable shields? This shop's got the best of 'em! These are absolute must-haves for a mercenary's dangerous work!
        DWAGO_SHOP_DIALOG             = 9269, -- Buy your goods here...or you'll regret it!
        KULHAMARIYO_SHOP_DIALOG       = 9270, -- Some fish to savorrr while you enjoy the sights of Aht Urhgan?
        KHAFJHIFANM_SHOP_DIALOG       = 9271, -- How about a souvenir for back home? There's nothing like dried dates to remind you of good times in Al Zahbi!
        HAGAKOFF_SHOP_DIALOG          = 9272, -- Welcome! Fill all your destructive needs with my superb weaponry! No good mercenary goes without a good weapon!
        BAJAHB_SHOP_DIALOG            = 9273, -- Good day! If you want to live long, you'll buy your armor here.
        MAZWEEN_SHOP_DIALOG           = 9274, -- Magic scrolls! Get your magic scrolls here!
        FAYEEWAH_SHOP_DIALOG          = 9275, -- Why not sit back a spell and enjoy the rich aroma and taste of a cup of chai?
        YAFAAF_SHOP_DIALOG            = 9276, -- There's nothing like the mature taste and luxurious aroma of coffee... Would you like a cup?
        WAHNID_SHOP_DIALOG            = 9277, -- All the fishing gear you'll ever need, here in one place!
        WAHRAGA_SHOP_DIALOG           = 9278, -- Welcome to the Alchemists' Guild. We open ourselves to the hidden secrets of nature in order to create wonders. Are you looking to buy one of them?
        GATHWEEDA_SHOP_DIALOG         = 9279, -- Only members of the Alchemists' Guild have the vision to create such fine products... Would you like to purchase something?
        ITEM_DELIVERY_DIALOG          = 9350, -- You have something you want delivered?
        AUTOMATON_VALOREDGE_UNLOCK    = 9588, -- You obtain the Valoredge X-900 head and frame!
        AUTOMATON_SHARPSHOT_UNLOCK    = 9593, -- You obtain the Sharpshot Z-500 head and frame!
        AUTOMATON_STORMWAKER_UNLOCK   = 9598, -- You obtain the Stormwaker Y-700 head and frame!
        AUTOMATON_SOULSOOTHER_UNLOCK  = 9630, -- You obtain the Soulsoother C-1000 head!
        AUTOMATON_SPIRITREAVER_UNLOCK = 9631, -- You obtain the Spiritreaver M-400 head!
        AUTOMATON_ATTACHMENT_UNLOCK   = 9647, -- You can now equip your automaton with <item>.
        SANCTION                      = 9800, -- You have received the Empire's Sanction.
        ZASSHAL_DIALOG                = 10994, -- 'ang about. Looks like the permit you got was the last one I 'ad, so it might take me a bit o' time to scrounge up some more. 'ere, don't gimme that look. I'll be restocked before you know it.
        RETRIEVE_DIALOG_ID            = 13513, -- You retrieve <item> from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.AHT_URHGAN_WHITEGATE]