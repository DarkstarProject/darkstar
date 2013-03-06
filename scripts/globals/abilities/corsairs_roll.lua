-----------------------------------
-- Ability: Corsair's Roll
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbilityRoll(caster, target, ability, total)
	local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
	local effectpower = {10, 11, 11, 12, 20, 13, 15, 16, 8, 17, 24, 6}
	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CORSAIRS_ROLL, effectpower[total], 0, duration, target:getID(), total, MOD_EXP_BONUS) == false) then
		ability:setMsg(423);
	end
end;