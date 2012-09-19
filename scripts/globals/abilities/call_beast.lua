-----------------------------------
-- Ability: Call Beast
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	--TODO: Look at ammo slot for jug pet type etc
	val = player:getEquipID(3);
	if(val==17860) then player:spawnPet(22);--Hare Familiar ok
	elseif(val==17861) then player:spawnPet(37); -- Keeneared Steffi OK
	elseif(val==17862) then player:spawnPet(31); -- Mayfly Familiar ok
	elseif(val==17863) then player:spawnPet(41); -- Shellbuster Orob OK
	elseif(val==17864) then player:spawnPet(21); -- Sheep Familiar OK
	elseif(val==17865) then player:spawnPet(36); -- Lullaby Melodia OK
	elseif(val==17866) then player:spawnPet(30); -- Lizard Familiar ok
	elseif(val==17867) then player:spawnPet(40); -- Coldblood Como OK
	elseif(val==17868) then player:spawnPet(28); -- Flowerpot Bill OK
	elseif(val==17869) then player:spawnPet(38); -- Flowerpot Ben OK
	elseif(val==17870) then player:spawnPet(27); -- Tiger Familiar OK
	elseif(val==17871) then player:spawnPet(39); -- Saber Siravarde OK
	elseif(val==17872) then player:spawnPet(33); -- Beetle Familiar OK
	elseif(val==17873) then player:spawnPet(45); -- Panzer Galahad OK
	elseif(val==17874) then player:spawnPet(49); -- Crafty Clyvonne OK
	elseif(val==17875) then player:spawnPet(50); -- Bloodclaw Shasra OK
	elseif(val==17876) then player:spawnPet(23); -- Crab Familiar OK
	elseif(val==17877) then player:spawnPet(24); -- Courier Carrie Skin NONOK
	elseif(val==17878) then player:spawnPet(51); -- Lucky Lulush OK
	elseif(val==17879) then player:spawnPet(52); -- Fatso Fargann OK
	elseif(val==17880) then player:spawnPet(32); -- Funguar Familiar OK
	elseif(val==17881) then player:spawnPet(53); -- Discreet Louise OK
	elseif(val==17882) then player:spawnPet(25); -- Homunculus OK
	elseif(val==17883) then player:spawnPet(54); -- Swift Sieghard OK
	elseif(val==17884) then player:spawnPet(47); -- Amigo Sabotender OK
	elseif(val==17885) then player:spawnPet(26); -- Flytrap Familiar OK
	elseif(val==17886) then player:spawnPet(42); -- Voracious Audrey OK
	elseif(val==17887) then player:spawnPet(29); -- Eft Familiar OK
	elseif(val==17888) then player:spawnPet(43); -- Ambusher Allie OK
	elseif(val==17889) then player:spawnPet(35); -- Mite Familiar OK
	elseif(val==17890) then player:spawnPet(44); -- Lifedrinker Lars OK
	elseif(val==17891) then player:spawnPet(34); -- Antlion Familiar OK
	elseif(val==17892) then player:spawnPet(46); -- Chopsuey Chucky OK
	elseif(val==17893) then player:spawnPet(55); -- Dipper Yuly OK
	elseif(val==17894) then player:spawnPet(56); -- Flowerpot Merle OK
	elseif(val==17895) then player:spawnPet(57); -- Nursery Nazuna OK
	elseif(val==17896) then player:spawnPet(58); -- Mailbuster Cetas OK
	elseif(val==17897) then player:spawnPet(59); -- Audacious Anna OK
	elseif(val==17898) then player:spawnPet(60); -- Presto Julio OK
	elseif(val==17899) then player:spawnPet(61); -- Bugeyed Broncha OK
	elseif(val==17900) then player:spawnPet(62); -- Gooey Gerard OK
	elseif(val==17901) then player:spawnPet(63); -- Gorefang Hobs OK
	elseif(val==17902) then player:spawnPet(64); -- Faithful Falcorr OK
	elseif(val==17903) then player:spawnPet(65); -- Crude Raphie OK
	elseif(val==17904) then player:spawnPet(66); -- Dapper Mac OK
	elseif(val==17905) then player:spawnPet(67); -- Slippery Silas OK
	elseif(val==17906) then player:spawnPet(68); -- Turbid Toloi
	end
end;
