-----------------------------------
-- Ability: Larceny
-- Allows you to steal 1 active
-- buff from an enemy. 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local effect1 = target:copyStatusEffect();
	local effect = target:dispelStatusEffect(EFFECTFLAG_DISPELABLE);

	if(effect = EFFECT_NONE) then
		ability:setMsg(156);
	else
		player:addStatusEffect(effect1:getType(), effect1:getPower(), effect1:getTickCount(), effect1:getDuration());
	end
	return effect1:getType();

end;