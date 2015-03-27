-----------------------------------
-- Ability: Aggressor
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
    local merits = player:getMerit(MERIT_AGGRESSIVE_AIM);
    player:addStatusEffect(EFFECT_AGGRESSOR,merits,0,180);
end;