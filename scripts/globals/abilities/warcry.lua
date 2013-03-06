-----------------------------------
-- Ability: Warcry
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local power = 0;
	local duration = 30;
	local sHead = player:getEquipID(SLOT_HEAD)
	if(sHead == 15072 or sHead == 15245) then
		duration = duration + 10;
	elseif(sHead == 10650) then
		duration = duration + 20;
	end
	if player:getMainJob() == 1 then
		power = math.floor((player:getMainLvl()/4)+4.75)/256;
	else
		power = math.floor((player:getSubLvl()/4)+4.75)/256;
	end
	power = power * 100;
	target:addStatusEffect(EFFECT_WARCRY,power,0,30);
end;
