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
        ITEM_CANNOT_BE_OBTAINED        = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE     = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED                  = 6388, -- Obtained: <item>.
        GIL_OBTAINED                   = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED               = 6391, -- Obtained key item: <keyitem>.
        KEYITEM_LOST                   = 6392, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL            = 6393, -- You do not have enough gil.
        HOMEPOINT_SET                  = 6479, -- Home point set!
        YOU_ACCEPT_THE_MISSION         = 6508, -- You have accepted the mission.
        ORIGINAL_MISSION_OFFSET        = 6513, -- You can consult the Mission section of the main menu to review your objectives. Speed and efficiency are your priorities. Dismissed.
        CONQUEST_BASE                  = 6581, -- Tallying conquest results...
        MARIADOK_DIALOG                = 6740, -- Your fate rides on the changing winds of Vana'diel. I can give you insight on the local weather.
        MOG_LOCKER_OFFSET              = 6848, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        ALCHEMY_SUPPORT                = 7053, -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        HEMEWMEW_DIALOG                = 7060, -- Hello, [sir/ma'am]. I have been appointed by the Guildworkers' Union to manage the trading of manufactured crafts and the exchange of guild points.
        GUILD_TERMINATE_CONTRACT       = 7067, -- You have terminated your trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild and formed a new one with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        GUILD_NEW_CONTRACT             = 7075, -- You have formed a new trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        NO_MORE_GP_ELIGIBLE            = 7082, -- You are not eligible to receive guild points at this time.
        GP_OBTAINED                    = 7087, -- Obtained: <number> guild points.
        NOT_HAVE_ENOUGH_GP             = 7088, -- You do not have enough guild points.
        ITEM_DELIVERY_DIALOG           = 10435, -- Need something sent to a friend's house? Sending items to your own house? You've come to the right place!
        DETZO_RIVALS_DIALOG            = 10586, -- Can I borrow it for just a few seconds? I'll give it back, promise! I'll even give you a reward!
        FAUSTIN_CLOSED_DIALOG          = 10779, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Ronfaure, but it's not easy getting stuff from areas that aren't under Bastokan control.
        RODELLIEUX_CLOSED_DIALOG       = 10780, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Fauregandi, but it's not easy getting stuff from areas that aren't under Bastokan control.
        MILLE_CLOSED_DIALOG            = 10781, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Norvallen, but it's not easy getting stuff from areas that aren't under Bastokan control.
        TIBELDA_CLOSED_DIALOG          = 10782, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Valdeaunia, but it's not easy getting stuff from areas that aren't under Bastokan control.
        GALDEO_CLOSED_DIALOG           = 10783, -- Sorry, I don't have anything to sell you. I'm trying to start a business selling goods from Li'Telor, but it's not easy getting stuff from areas that aren't under Bastokan control.
        TAMI_MY_HUSBAND                = 10785, -- My husband's name is Zelman. You'll find him in the Zeruhn Mines. He's a miner. All right, then, off you go!
        FISHING_MESSAGE_OFFSET         = 10800, -- You can't fish here.
        DEEGIS_SHOP_DIALOG             = 10900, -- The only things an adventurer needs are courage and a good suit of armor! Welcome to Deegis's Armour!
        ZEMEDARS_SHOP_DIALOG           = 10901, -- Everything in our store is top-grade and Galka-made! What're you lookin' for?
        BOYTZ_SHOP_DIALOG              = 10902, -- Welcome to Boytz's Knickknacks.
        GELZERIO_SHOP_DIALOG           = 10903, -- ...Yes?
        GRISELDA_SHOP_DIALOG           = 10904, -- Good of you to drop by the Bat's Lair Inn! Why don't you try some of our specialty plates?
        NEIGEPANCE_SHOP_DIALOG         = 10905, -- Hello there. A well-fed chocobo is a happy chocobo!
        FAUSTIN_OPEN_DIALOG            = 10906, -- Hello there! Might I interest you specialty goods from Ronfaure?
        MILLE_OPEN_DIALOG              = 10907, -- Hello there! Might I interest you specialty goods from Norvallen?
        RODELLIEUX_OPEN_DIALOG         = 10908, -- Hello there! Might I interest you specialty goods from Fauregandi?
        TIBELDA_OPEN_DIALOG            = 10909, -- Goods of all varieties, imported directly from the northern land of Valdeaunia!
        MAYMUNAH_SHOP_DIALOG           = 10910, -- Welcome to the Alchemists' Guild! Looking for something specific?
        ODOBA_SHOP_DIALOG              = 10911, -- Welcome to the Alchemists' Guild. How may I help you?
        VIRNAGE_DIALOG_1               = 10982, -- They stayed in a citadel on the Sauromugue Champaign. The paint may be there still! I have heard people here say you are a great adventurer. Please, help the Goddess in Her hour of need!
        VIRNAGE_DIALOG_2               = 10988, -- Hand my letter to Eperdur in the San d'Oria Cathedral to claim your reward.
        CONQUEST                       = 11111, -- You've earned conquest points!
        GALDEO_OPEN_DIALOG             = 11471, -- Come! Take a look at all the wonderful goods from Li'Telor.
        AULAVIA_OPEN_DIALOG            = 11472, -- May I interest you in some specialty goods from Vollbow?
        AULAVIA_CLOSED_DIALOG          = 11473, -- I'm trying to start a business selling goods from Vollbow, but it's not easy getting stuff from areas that aren't under Bastokan control.
        EXTENDED_MISSION_OFFSET        = 11614, -- Go to Ore Street and talk to Medicine Eagle. He says he was there when the commotion started.
        PROUDBEARD_SHOP_DIALOG         = 11642, -- Would you be interested in a nice suit of adventurer-issue armor? Be careful when you buy, though. We offer no refunds.
        TRICK_OR_TREAT                 = 11686, -- Trick or treat...
        THANK_YOU_TREAT                = 11687, -- Thank you... And now for your treat...
        HERE_TAKE_THIS                 = 11688, -- Here, take this...
        IF_YOU_WEAR_THIS               = 11689, -- If you put this on and walk around, something...unexpected might happen...
        THANK_YOU                      = 11690, -- Thank you...
        GROUND_STRIKE_LEARNED          = 11712, -- You have learned the weapon skill Ground Strike!
        YOU_CANNOT_ENTER_DYNAMIS       = 11725, -- You cannot enter Dynamis - [Dummy/San d'Oria/Bastok/Windurst/Jeuno/Beaucedine/Xarcabard/Valkurm/Buburimu/Qufim/Tavnazia] for <number> [day/days] (Vana'diel time).
        PLAYERS_HAVE_NOT_REACHED_LEVEL = 11727, -- Players who have not reached level <number> are prohibited from entering Dynamis.
        DYNA_NPC_DEFAULT_MESSAGE       = 11738, -- There is an unusual arrangement of pebbles here.
        THE_GATE_IS_LOCKED             = 12160, -- The gate is locked.
        EMALIVEULAUX_COP_NOT_COMPLETED = 12241, -- I'd like to start my own business someday, but I just haven't found anything that truly interests me.
        EMALIVEULAUX_OPEN_DIALOG       = 12242, -- Rare Tavnazian imports! Get them before they're gone!
        EMALIVEULAUX_CLOSED_DIALOG     = 12243, -- I'd love to sell you goods imported from the island of Tavnazia, but with the area under foreign control, I can't secure my trade routes...
        COMMON_SENSE_SURVIVAL          = 15991, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        TEAR_IN_FABRIC_OF_SPACE        = 16579, -- There appears to be a tear in the fabric of space...
    },
    mob =
    {
    },
    npc =
    {
        HALLOWEEN_SKINS =
        {
            [17735742] = 41, -- Faustin
            [17735744] = 43, -- Mille
            [17735747] = 42, -- Aulavia
            [17735795] = 40, -- Proud Beard
            [17735818] = 44, -- Emaliveulaux
        },
        LELEROON_BLUE_DOOR = 17735847,
        EXPLORER_MOOGLE    = 17735856,
    },
}

return zones[dsp.zone.BASTOK_MINES]