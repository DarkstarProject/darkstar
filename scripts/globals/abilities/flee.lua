-----------------------------------
-- Ability: Flee
-----------------------------------

require("scripts/globals/status");


-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local buff = 30;
	local sFeet = player:getEquipID(SLOT_FEET);
	if (sFeet == 14094) or (sFeet == 15357) then
		buff = buff + 15;
	end
	player:addStatusEffect(EFFECT_FLEE,100,0,buff);
end;