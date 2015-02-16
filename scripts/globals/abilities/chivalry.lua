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
	-- (TP/10 * .5) + ((0.015 * TP/10) * MND) = MP Gained
	local amount = (target:getTP()/10*(0.5 * merits)) + ((0.015*target:getTP())/10 * target:getStat(MOD_MND));
	target:addMP(amount);
	target:setTP(0);
	return amount;
end;
