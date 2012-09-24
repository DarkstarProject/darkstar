-----------------------------------
-- Ability: Dodge
-----------------------------------

require("scripts/globals/status");


-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local sLegs = player:getEquipID(SLOT_LEGS);
	local power = 20
	if(sLegs == 14090 or sLegs == 15353) then
		power = power + 10;
	end
	player:addStatusEffect(EFFECT_DODGE,power,0,120);
end;