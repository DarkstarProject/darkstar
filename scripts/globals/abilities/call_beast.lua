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
	if(val==17876) then player:spawnPet(23);--crab
	elseif(val==17864) then player:spawnPet(21); --sheep
	elseif(val==17860) then player:spawnPet(22); --hare
	elseif(val==17882) then player:spawnPet(25); --homo
	elseif(val==17870) then player:spawnPet(27); --tiger
	elseif(val==17885) then player:spawnPet(26); --flytrap
	elseif(val==17866) then player:spawnPet(30); --lizard
	elseif(val==17880) then player:spawnPet(32); --funguar
	elseif(val==17887) then player:spawnPet(29); --eft
	elseif(val==17862) then player:spawnPet(31); --mayfly
	elseif(val==17872) then player:spawnPet(33); --beetle
	elseif(val==17891) then player:spawnPet(34); --antlion
	elseif(val==17889) then player:spawnPet(35); --diremite
	else
	player:spawnPet(23);
	end
end;
