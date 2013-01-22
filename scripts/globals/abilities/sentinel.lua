-----------------------------------
-- Ability: Sentinel
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local sFeet = player:getEquipID(SLOT_FEET);
	local power = -90;
	if(sFeet == 15138 or sFeet == 15671) then
		power = power - 10;
	end

	player:addStatusEffect(EFFECT_SENTINEL,power,3,30);

end;