-----------------------------------
-- Ability: Call Beast
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	--TODO: Look at ammo slot for jug pet type etc
	switch(player:getEquipID(SLOT_AMMO)) : caseof{
		[17860] = function (x) player:spawnPet(22) end, -- Hare Familiar ok
		[17861] = function (x) player:spawnPet(37) end, -- Keeneared Steffi OK
		[17862] = function (x) player:spawnPet(31) end, -- Mayfly Familiar ok
		[17863] = function (x) player:spawnPet(41) end, -- Shellbuster Orob OK
		[17864] = function (x) player:spawnPet(21) end, -- Sheep Familiar OK
		[17865] = function (x) player:spawnPet(36) end, -- Lullaby Melodia OK
		[17866] = function (x) player:spawnPet(30) end, -- Lizard Familiar ok
		[17867] = function (x) player:spawnPet(40) end, -- Coldblood Como OK
		[17868] = function (x) player:spawnPet(28) end, -- Flowerpot Bill OK
		[17869] = function (x) player:spawnPet(38) end, -- Flowerpot Ben OK
		[17870] = function (x) player:spawnPet(27) end, -- Tiger Familiar OK
		[17871] = function (x) player:spawnPet(39) end, -- Saber Siravarde OK
		[17872] = function (x) player:spawnPet(33) end, -- Beetle Familiar OK
		[17873] = function (x) player:spawnPet(45) end, -- Panzer Galahad OK
		[17874] = function (x) player:spawnPet(49) end, -- Crafty Clyvonne OK
		[17875] = function (x) player:spawnPet(50) end, -- Bloodclaw Shasra OK
		[17876] = function (x) player:spawnPet(23) end, -- Crab Familiar OK
		[17877] = function (x) player:spawnPet(24) end, -- Courier Carrie Skin NONOK
		[17878] = function (x) player:spawnPet(51) end, -- Lucky Lulush OK
		[17879] = function (x) player:spawnPet(52) end, -- Fatso Fargann OK
		[17880] = function (x) player:spawnPet(32) end, -- Funguar Familiar OK
		[17881] = function (x) player:spawnPet(53) end, -- Discreet Louise OK
		[17882] = function (x) player:spawnPet(25) end, -- Homunculus OK
		[17883] = function (x) player:spawnPet(54) end, -- Swift Sieghard OK
		[17884] = function (x) player:spawnPet(47) end, -- Amigo Sabotender OK
		[17885] = function (x) player:spawnPet(26) end, -- Flytrap Familiar OK
		[17886] = function (x) player:spawnPet(42) end, -- Voracious Audrey OK
		[17887] = function (x) player:spawnPet(29) end, -- Eft Familiar OK
		[17888] = function (x) player:spawnPet(43) end, -- Ambusher Allie OK
		[17889] = function (x) player:spawnPet(35) end, -- Mite Familiar OK
		[17890] = function (x) player:spawnPet(44) end, -- Lifedrinker Lars OK
		[17891] = function (x) player:spawnPet(34) end, -- Antlion Familiar OK
		[17892] = function (x) player:spawnPet(46) end, -- Chopsuey Chucky OK
		[17893] = function (x) player:spawnPet(55) end, -- Dipper Yuly OK
		[17894] = function (x) player:spawnPet(56) end, -- Flowerpot Merle OK
		[17895] = function (x) player:spawnPet(57) end, -- Nursery Nazuna OK
		[17896] = function (x) player:spawnPet(58) end, -- Mailbuster Cetas OK
		[17897] = function (x) player:spawnPet(59) end, -- Audacious Anna OK
		[17898] = function (x) player:spawnPet(60) end, -- Presto Julio OK
		[17899] = function (x) player:spawnPet(61) end, -- Bugeyed Broncha OK
		[17900] = function (x) player:spawnPet(62) end, -- Gooey Gerard OK
		[17901] = function (x) player:spawnPet(63) end, -- Gorefang Hobs OK
		[17902] = function (x) player:spawnPet(64) end, -- Faithful Falcorr OK
		[17903] = function (x) player:spawnPet(65) end, -- Crude Raphie OK
		[17904] = function (x) player:spawnPet(66) end, -- Dapper Mac OK
		[17905] = function (x) player:spawnPet(67) end, -- Slippery Silas OK
		[17906] = function (x) player:spawnPet(68) end, -- Turbid Toloi
	}
end;
