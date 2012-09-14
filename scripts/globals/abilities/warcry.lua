-----------------------------------
-- Ability: Warcry
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	duration = 30;
	if player:getEquipID(4) == 15072 or player:getEquipID(4) == 15245 then
		duration = duration + 10;
	elseif player:getEquipID(4) == 10650 then
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
