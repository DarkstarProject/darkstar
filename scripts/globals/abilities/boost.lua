-----------------------------------
-- Ability: Boost
-----------------------------------

require("scripts/globals/status");


-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	sHands = player:getEquipID(5);
	power = 12.5
	if(sHands == 13962 or sHands == 14891) then
		power = power + 5.5;
	end
	
	if(player:hasStatusEffect(EFFECT_BOOST) == true) then
		effect = player:getStatusEffect(EFFECT_BOOST);
		newPower = effect:getPower() + power;
		effect:setPower(newPower);
		player:addMod(MOD_ATTP,power);
	else
		player:addStatusEffect(EFFECT_BOOST,power,1,180);
	end
end;