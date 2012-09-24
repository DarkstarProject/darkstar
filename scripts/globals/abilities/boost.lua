-----------------------------------
-- Ability: Boost
-----------------------------------

require("scripts/globals/status");


-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local sHands = player:getEquipID(SLOT_HANDS);
	local power = 12.5
	if(sHands == 13962 or sHands == 14891) then
		power = power + 5.5;
	end
	
	if(player:hasStatusEffect(EFFECT_BOOST) == true) then
		local effect = player:getStatusEffect(EFFECT_BOOST);
		effect:setPower(effect:getPower() + power);
		player:addMod(MOD_ATTP,power);
	else
		player:addStatusEffect(EFFECT_BOOST,power,1,180);
	end
end;