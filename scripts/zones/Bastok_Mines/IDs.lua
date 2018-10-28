-----------------------------------
-- Area: Bastok_Mines
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BASTOK_MINES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED        = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE     = 6385, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                  = 6387, -- Obtained: <item>.
        GIL_OBTAINED                   = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6390, -- Obtained key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL            = 6392, -- You do not have enough gil.
        HOMEPOINT_SET                  = 6478, -- Home point set!
        YOU_ACCEPT_THE_MISSION         = 6507, -- You have accepted the mission.
        ORIGINAL_MISSION_OFFSET        = 6512, -- You can consult the Mission section of the main menu to review your objectives. Speed and efficiency are your priorities. Dismissed.
        CONQUEST_BASE                  = 6580, -- Tallying conquest results...
        MARIADOK_DIALOG                = 6739, -- Your fate rides on the changing winds of Vana'diel. I can give you insight on the local weather.
        MOG_LOCKER_OFFSET              = 6847, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        ALCHEMY_SUPPORT                = 7052, -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        HEMEWMEW_DIALOG                = 7059, -- Hello, [sir/ma'am]. I have been appointed by the Guildworkers' Union to manage the trading of manufactured crafts and the exchange of guild points.
        GUILD_TERMINATE_CONTRACT       = 7066, -- You have terminated your trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild and formed a new one with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        GUILD_NEW_CONTRACT             = 7074, -- You have formed a new trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        NO_MORE_GP_ELIGIBLE            = 7081, -- You are not eligible to receive guild points at this time.
        GP_OBTAINED                    = 7086, -- Obtained: <number> guild points.
        NOT_HAVE_ENOUGH_GP             = 7087, -- You do not have enough guild points.
        ITEM_DELIVERY_DIALOG           = 10434, -- Need something sent to a friend's house? Sending items to your own house? You've come to the right place!
        DETZO_RIVALS_DIALOG            = 10585, -- Can I borrow it for just a few seconds? I'll give it back, promise! I'll even give you a reward!
        FAUSTIN_CLOSED_DIALOG          = 10778, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Ronfaure, but it's not easy getting stuff from areas that aren't under Bastokan control.
        RODELLIEUX_CLOSED_DIALOG       = 10779, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Fauregandi, but it's not easy getting stuff from areas that aren't under Bastokan control.
        MILLE_CLOSED_DIALOG            = 10780, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Norvallen, but it's not easy getting stuff from areas that aren't under Bastokan control.
        TIBELDA_CLOSED_DIALOG          = 10781, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Valdeaunia, but it's not easy getting stuff from areas that aren't under Bastokan control.
        GALDEO_CLOSED_DIALOG           = 10782, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Li'Telor, but it's not easy getting stuff from areas that aren't under Bastokan control.
        TAMI_MY_HUSBAND                = 10784, -- My husband's name is Zelman. You'll find him in the Zeruhn Mines. He's a miner. All right, then, off you go!
        FISHING_MESSAGE_OFFSET         = 10799, -- You can't fish here.
        DEEGIS_SHOP_DIALOG             = 10899, -- The only things an adventurer needs are courage and a good suit of armor! Welcome to Deegis's Armour!
        ZEMEDARS_SHOP_DIALOG           = 10900, -- Everything in our store is top-grade and Galka-made! What're you lookin' for?
        BOYTZ_SHOP_DIALOG              = 10901, -- Welcome to Boytz's Knickknacks.
        GELZERIO_SHOP_DIALOG           = 10902, -- ...Yes?
        GRISELDA_SHOP_DIALOG           = 10903, -- Good of you to drop by the Bat's Lair Inn! Why don't you try some of our specialty plates?
        NEIGEPANCE_SHOP_DIALOG         = 10904, -- Hello there. A well-fed chocobo is a happy chocobo!
        FAUSTIN_OPEN_DIALOG            = 10905, -- Hello there! Might I interest you specialty goods from Ronfaure?
        MILLE_OPEN_DIALOG              = 10906, -- Hello there! Might I interest you specialty goods from Norvallen?
        RODELLIEUX_OPEN_DIALOG         = 10907, -- Hello there! Might I interest you specialty goods from Fauregandi?
        TIBELDA_OPEN_DIALOG            = 10908, -- Goods of all varieties, imported directly from the northern land of Valdeaunia!
        MAYMUNAH_SHOP_DIALOG           = 10909, -- Welcome to the Alchemists' Guild! Looking for something specific?
        ODOBA_SHOP_DIALOG              = 10910, -- Welcome to the Alchemists' Guild. How may I help you?
        VIRNAGE_DIALOG_1               = 10981, -- They stayed in a citadel on the Sauromugue Champaign. The paint may be there still! I have heard people here say you are a great adventurer. Please, help the Goddess in Her hour of need!
        VIRNAGE_DIALOG_2               = 10987, -- Hand my letter to Eperdur in the San d'Oria Cathedral to claim your reward.
        CONQUEST                       = 11110, -- You've earned conquest points!
        GALDEO_OPEN_DIALOG             = 11470, -- Come! Take a look at all the wonderful goods from Li'Telor.
        AULAVIA_OPEN_DIALOG            = 11471, -- May I interest you in some specialty goods from Vollbow?
        AULAVIA_CLOSED_DIALOG          = 11472, -- I'm trying to start a business selling goods from Vollbow, but it's not easy getting stuff from areas that aren't under Bastokan control.
        EXTENDED_MISSION_OFFSET        = 11613, -- Go to Ore Street and talk to Medicine Eagle. He says he was there when the commotion started.
        PROUDBEARD_SHOP_DIALOG         = 11641, -- Would you be interested in a nice suit of adventurer-issue armor? Be careful when you buy, though. We offer no refunds.
        TRICK_OR_TREAT                 = 11685, -- Trick or treat...
        THANK_YOU_TREAT                = 11686, -- Thank you... And now for your treat...
        HERE_TAKE_THIS                 = 11687, -- Here, take this...
        IF_YOU_WEAR_THIS               = 11688, -- If you put this on and walk around, something...unexpected might happen...
        THANK_YOU                      = 11689, -- Thank you...
        GROUND_STRIKE_LEARNED          = 11711, -- You have learned the weapon skill Ground Strike!
        YOU_CANNOT_ENTER_DYNAMIS       = 11724, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 11726, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        UNUSUAL_ARRANGEMENT_PEBBLES    = 11737, -- There is an unusual arrangement of pebbles here.
        THE_GATE_IS_LOCKED             = 12159, -- The gate is locked.
        EMALIVEULAUX_COP_NOT_COMPLETED = 12240, -- I'd like to start my own business someday, but I just haven't found anything that truly interests me.
        EMALIVEULAUX_OPEN_DIALOG       = 12241, -- Rare Tavnazian imports! Get them before they're gone!
        EMALIVEULAUX_CLOSED_DIALOG     = 12242, -- I'd love to sell you goods imported from the island of Tavnazia, but with the area under foreign control, I can't secure my trade routes...
        TEAR_IN_FABRIC_OF_SPACE        = 16547, -- There appears to be a tear in the fabric of space...
    },
    mob =
    {
    },
    npc =
    {
        LELEROON_BLUE_DOOR           = 17735847,
        BASTOK_MINES_EXPLORER_MOOGLE = 17735856,
    },
}

return zones[dsp.zone.BASTOK_MINES]