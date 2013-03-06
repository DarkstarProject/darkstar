-----------------------------------
-- Ability: Meditate
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local amount = 12;
	if(player:getMainJob()==12) then
		amount = 20;
	end
	--TODO: Meditate doesnt actually give an icon, it's not regain as such.
	local tick = 15;
	local extratick = 0;
	local sHands = target:getEquipID(SLOT_HANDS);
	local sHead = target:getEquipID(SLOT_HEAD);
	if (sHands == 15113 or sHands == 14920) then
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
	player:addStatusEffectEx(EFFECT_REGAIN,0,amount,3,tick);
end;
