-----------------------------------
-- Ability: Chi Blast
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	local boost = player:getStatusEffect(EFFECT_BOOST);
	local multiplier = 1.0;
	if(boost ~= nil) then
		multiplier = (boost:getPower()/100) * 4; --power is the raw % atk boost
	end
	
	local dmg = math.floor(player:getStat(MOD_MND)*(0.5+(math.random()/2))) * multiplier;

	dmg = utils.stoneskin(target, dmg);
	
	target:delHP(dmg);
    target:updateEnmityFromDamage(player,dmg);
	player:delStatusEffect(EFFECT_BOOST);
	return dmg;
end;
