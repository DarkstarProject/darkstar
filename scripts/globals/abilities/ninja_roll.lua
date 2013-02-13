-----------------------------------
-- Ability: Ninja Roll
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbilityRoll(caster, target, ability, total)
	local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
	local effectpowers = {4, 5, 5, 14, 6, 7, 9, 2, 10, 11, 18, 6}
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_NIN) ) then
		effectpower = effectpower + 6;
	end
	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_NINJA_ROLL, effectpower, 0, duration, target:getID(), total, MOD_EVA) == false) then
		ability:setMsg(423);
	end
end;