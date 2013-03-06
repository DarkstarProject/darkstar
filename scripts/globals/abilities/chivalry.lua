-----------------------------------
-- Ability: Chivalry
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
--(TP * .5) + ((0.015 * TP) * MND) = MP Gained
	amount = (target:getTP()*0.5) + ((0.015*target:getTP()) * target:getStat(MOD_MND));
	target:addMP(amount);
	target:setTP(0);
end;
