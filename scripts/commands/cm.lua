---------------------------------------------------------------------------------------------------
-- func: BNETcc fixed items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Stuffs WE Fixed that needs testing. #CMGMSlavery", 0x1C);
	
stock = {
		27748, 1, -- Shabti Armet
		27891, 1, -- Shabti Cuirass
		28178, 1, -- Shabti Cuisses
		28038, 1, -- Shabti Gauntlets
		28316, 1, -- Shabti Sabatons
		27749, 1, -- Shabti Armet +1
		27892, 1, -- Shabti Cuirass +1
		28179, 1, -- Shabti Cuisses +1
		28039, 1, -- Shabti Gauntlets +1
		28317, 1, -- Shabti Sabatons +1
		27750, 1, -- Haruspex Hat
		27893, 1, -- Haruspex Coat
		28180, 1, -- Haruspex Slops
		28040, 1, -- Haruspex Cuffs
		28318, 1, -- Haru. Pigaches
		27751, 1, -- Haruspex Hat +1
		27894, 1, -- Haruspex Coat +1
		28181, 1, -- Haruspex Slops +1
		28041, 1, -- Haruspex Cuffs +1
		28319, 1, -- Haru. Pigaches +1
		27746, 1, -- Aetosaur Helm
		27889, 1, -- Aetosaur Jerkin
		28176, 1, -- Aeto. Trousers
		28036, 1, -- Aetosaur Gloves
		28314, 1, -- Aeto. Ledelsens
		27747, 1, -- Aetosaur Helm +1
		27890, 1, -- Aetosaur Jerkin +1
		28177, 1, -- Aeto. Trousers +1
		28037, 1, -- Aetosaur Gloves +1
		28315, 1, -- Aeto. Ledelsens +1
		27568, 1, -- Ramuh Ring
		27569, 1, -- Ramuh Ring +1
		27578, 1, -- Fenrir Ring
		27579, 1, -- Fenrir Ring +1
		27564, 1, -- Ifrit Ring
		27572, 1, -- Garuda Ring
		27573, 1, -- Garuda Ring +1
		20621, 1, -- Nanti Knife
		20622, 1, -- Nanti Knife +1
		20843, 1, -- Chango
		20515, 1, -- Godhands
		20695, 1, -- Sequence
		21694, 1, -- Lionheart
		21753, 1, -- Tri-Edge
		20890, 1, -- Anguta
		20935, 1, -- Trishula
		21025, 1, -- Dojikiri Yasutsuna
		21082, 1, -- Tishtrya
		21147, 1, -- Khatvanga
    }

showShop(player, STATIC, stock);
end