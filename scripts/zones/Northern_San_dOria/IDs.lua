-----------------------------------
-- Area: Northern_San_dOria
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.NORTHERN_SAN_DORIA] =
{
    text =
    {
        YOU_ACCEPT_THE_MISSION   = 5, -- You accept the mission.
        ORIGINAL_MISSION_OFFSET  = 16, -- Bring me one of those axes, and your mission will be a success. No running away now; we've a proud country to defend!
        HOMEPOINT_SET            = 188, -- Home point set!
        ITEM_CANNOT_BE_OBTAINED  = 6589, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6595, -- Obtained: <item>.
        GIL_OBTAINED             = 6596, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6598, -- Obtained key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL      = 6600, -- You do not have enough gil.
        MOG_LOCKER_OFFSET        = 6828, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        IMAGE_SUPPORT            = 6952, -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        GUILD_TERMINATE_CONTRACT = 6966, -- You have terminated your trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild and formed a new one with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        GUILD_NEW_CONTRACT       = 6974, -- You have formed a new trading contract with the [Fishermen's/Carpenters'/Blacksmiths'/Goldsmiths'/Weavers'/Tanners'/Boneworkers'/Alchemists'/Culinarians'] Guild.
        NO_MORE_GP_ELIGIBLE      = 6981, -- You are not eligible to receive guild points at this time.
        GP_OBTAINED              = 6986, -- Obtained: <number> guild points.
        NOT_HAVE_ENOUGH_GP       = 6987, -- You do not have enough guild points.
        CONQUEST_BASE            = 7257, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 7416, -- You can't fish here.
        GUILBERDRIER_DIALOG      = 11144, -- A magic shop, you say? A bit of magic would come in handy... I know! I'll have my daughter study it for me!
        ABIOLEGET_DIALOG         = 11220, -- All of Altana's children are welcome here.
        PELLIMIE_DIALOG          = 11221, -- Is this your first time here? Join us in prayer!
        FITTESEGAT_DIALOG        = 11222, -- Paradise is a place without fear, without death!
        MAURINE_DIALOG           = 11223, -- Papsque Shamonde sometimes addresses the city from the balcony, you know. I long for his blessing, if but once!
        PRERIVON_DIALOG          = 11224, -- With each sermon, I take another step closer to Paradise.
        MALFINE_DIALOG           = 11225, -- Truly fortunate are we that words of sacrament are read every day!
        OLBERGIEUT_DIALOG        = 11268, -- Friar Faurbellant is on retreat at the Crag of Holla. Please give <item> to him.
        GUILERME_DIALOG          = 11340, -- Behold Chateau d'Oraguille, the greatest fortress in the realm!
        PHAVIANE_DIALOG          = 11344, -- This is Victory Arch. Beyond lies Southern San d'Oria.
        SOCHIENE_DIALOG          = 11345, -- You stand before Victory Arch. Southern San d'Oria is on the other side.
        PEPIGORT_DIALOG          = 11346, -- This gate leads to Port San d'Oria.
        RODAILLECE_DIALOG        = 11347, -- This is Ranperre Gate. Fiends lurk in the lands beyond, so take caution!
        GALAHAD_DIALOG           = 11360, -- Welcome to the Consulate of Jeuno. I am Galahad, Consul to San d'Oria.
        ISHWAR_DIALOG            = 11361, -- May I assist you?
        ARIENH_DIALOG            = 11362, -- If you have business with Consul Galahad, you'll find him inside.
        EMILIA_DIALOG            = 11363, -- Welcome to the Consulate of Jeuno.
        HELAKU_DIALOG            = 11392, -- Leave this building, and you'll see a great fortress to the right. That's Chateau d'Oraguille. And be polite; San d'Orians can be quite touchy.
        KASARORO_DIALOG          = 11431, -- Step right outside, and you'll see a big castle on the left. That's Chateau d'Oraguille. They're a little touchy in there, so mind your manners!
        MAURINNE_DIALOG          = 11468, -- This part of town is so lively, I like watching everybody just go about their business.
        AIVEDOIR_DIALOG          = 11502, -- That's funny. I could have sworn she asked me to meet her here...
        BERTENONT_DIALOG         = 11504, -- Stars are more beautiful up close. Don't you agree?
        FLYER_REFUSED            = 11516, -- Your flyer is refused.
        GILIPESE_DIALOG          = 11525, -- Nothing to report!
        DOGGOMEHR_SHOP_DIALOG    = 11538, -- Welcome to the Blacksmiths' Guild shop.
        CAUZERISTE_SHOP_DIALOG   = 11606, -- Welcome! San d'Oria Carpenters' Guild shop, at your service.
        LUCRETIA_SHOP_DIALOG     = 11539, -- Blacksmiths' Guild shop, at your service!
        ANTONIAN_OPEN_DIALOG     = 11621, -- Interested in goods from Aragoneu?
        BONCORT_SHOP_DIALOG      = 11622, -- Welcome to the Phoenix Perch!
        PIRVIDIAUCE_SHOP_DIALOG  = 11623, -- Care to see what I have?
        PALGUEVION_OPEN_DIALOG   = 11624, -- I've got a shipment straight from Valdeaunia!
        VICHUEL_OPEN_DIALOG      = 11625, -- Fauregandi produce for sale!
        ARLENNE_SHOP_DIALOG      = 11626, -- Welcome to the Royal Armory!
        TAVOURINE_SHOP_DIALOG    = 11627, -- Looking for a weapon? We've got many in stock!
        JUSTI_SHOP_DIALOG        = 11629, -- Hello!
        ANTONIAN_CLOSED_DIALOG   = 11631, -- The Kingdom's influence is waning in Aragoneu. I cannot import goods from that region, though I long to.
        PALGUEVION_CLOSED_DIALOG = 11632, -- Would that Valdeaunia came again under San d'Orian dominion, I could then import its goods!
        VICHUEL_CLOSED_DIALOG    = 11633, -- I'd make a killing selling Fauregandi produce here, but that region's not under San d'Orian control!
        ATTARENA_CLOSED_DIALOG   = 11634, -- Once all of Li'Telor is back under San d'Orian influence, I'll fill my stock with unique goods from there!
        EUGBALLION_CLOSED_DIALOG = 11635, -- I'd be making a fortune selling goods from Qufim Island...if it were only under San d'Orian control!
        EUGBALLION_OPEN_DIALOG   = 11636, -- Have a look at these goods imported direct from Qufim Island!
        CHAUPIRE_SHOP_DIALOG     = 11637, -- San d'Orian woodcraft is the finest in the land!
        CONQUEST                 = 11703, -- You've earned conquest points!
        BONCORT_DIALOG           = 12050, -- Hmm... With magic, I could get hold of materials a mite easier. I'll have to check this mart out.
        CAPIRIA_DIALOG           = 12051, -- A flyer? For me? Some reading material would be a welcome change of pace, indeed!
        VILLION_DIALOG           = 12052, -- Opening a shop of magic, without consulting me first? I must pay this Regine a visit!
        COULLENE_DIALOG          = 12053, -- Magic could be of use on my journey to Paradise. Thank you so much!
        FLYER_ACCEPTED           = 12054, -- Your flyer is accepted!
        FLYER_ALREADY            = 12055, -- This person already has a flyer.
        MOGHOUSE_EXIT            = 12354, -- You have learned your way through the back alleys of San d'Oria! Now you can exit to any area from your residence.
        GAUDYLOX_SHOP_DIALOG     = 12614, -- <Phssshooooowoooo> You never see Goblinshhh from underworld? Me no bad. Me sell chipshhh. You buy. Use with shhhtone heart. You get lucky!
        MILLECHUCA_CLOSED_DIALOG = 12615, -- I've been trying to import goods from Vollbow, but it's so hard to get items from areas that aren't under San d'Orian control.
        ATTARENA_OPEN_DIALOG     = 12700, -- Good day! Take a look at my selection from Li'Telor!
        MILLECHUCA_OPEN_DIALOG   = 12701, -- Specialty goods from Vollbow! Specialty goods from Vollbow!
        SHIVA_UNLOCKED           = 12799, -- You are now able to summon [Ifrit/Titan/Leviathan/Garuda/Shiva/Ramuh].
        ARACHAGNON_SHOP_DIALOG   = 12903, -- Would you be interested in purchasing some adventurer-issue armor? Be careful when selecting, as we accept no refunds.
        TRICK_OR_TREAT           = 13046, -- Trick or treat...
        THANK_YOU_TREAT          = 13047, -- Thank you... And now for your treat...
        HERE_TAKE_THIS           = 13048, -- Here, take this...
        IF_YOU_WEAR_THIS         = 13049, -- If you put this on and walk around, something...unexpected might happen...
        THANK_YOU                = 13050, -- Thank you...
        COULLENE_MESSAGE         = 13367, -- Coullene looks over curiously for a moment.
        GUILBERDRIER_MESSAGE     = 13368, -- Guilberdrier looks over curiously for a moment.
        BONCORT_MESSAGE          = 13369, -- Boncort looks over curiously for a moment.
        CAPIRIA_MESSAGE          = 13370, -- Capiria looks over curiously for a moment.
        VILLION_MESSAGE          = 13371, -- Villion looks over curiously for a moment.
        RETRIEVE_DIALOG_ID       = 18111, -- You retrieve <item> from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
        N_SANDY_EXPLORER_MOOGLE = 17723648,
    },
}

return zones[dsp.zone.NORTHERN_SAN_DORIA]