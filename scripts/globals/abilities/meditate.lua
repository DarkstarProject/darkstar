-----------------------------------
-- Ability: Meditate
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	local amount = 12;
	if(player:getMainJob()==12) then
		amount = 20;
	end

	local tick = 15;
	local extratick = 0;
	local sHands = target:getEquipID(SLOT_HANDS);
	local sHead = target:getEquipID(SLOT_HEAD);
	-- Todo: change these item checks into a modifier.
	if (sHands == 15113 or sHands == 14920 or sHands == 10701) then
		extratick = 1;
	end
	if (sHead == 13868 or sHead == 15236) then
		extratick = extratick + 1;
	end
	if (extratick == 1) then
		extratick = math.random(1,2);
	elseif (extratick == 2) then
		extratick = math.random(2,3);
	end

	tick = tick + (extratick * 3);
	player:addStatusEffectEx(EFFECT_MEDITATE,0,amount,3,tick);
end;
