-----------------------------------
-- Ability: Chivalry
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
    local merits = player:getMerit(MERIT_CHIVALRY);
--(TP * .5) + ((0.015 * TP) * MND) = MP Gained
	local amount = ((target:getTP()*(0.5)) + ((0.015*target:getTP()) * target:getStat(MOD_MND))) * ((merits - 5) / 100)
    target:setTP(0);
	return target:addMP(amount);
end;
