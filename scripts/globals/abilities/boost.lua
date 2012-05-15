-----------------------------------
-- Ability: Boost
-----------------------------------

require("scripts/globals/status");


-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	if(player:hasStatusEffect(EFFECT_BOOST) == true) then
		effect = player:getStatusEffect(EFFECT_BOOST);
		duration = effect:getDuration();
		lastTick = effect:getLastTick();
		duration = duration/100 - lastTick;
		Power = effect:getPower() + 12.5;
		player:delStatusEffect(EFFECT_BOOST);
		player:addStatusEffect(EFFECT_BOOST,Power,1,duration);
	else
		player:addStatusEffect(EFFECT_BOOST,12.5,1,180);
	end
end;