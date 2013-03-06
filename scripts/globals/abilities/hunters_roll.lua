-----------------------------------
-- Ability: Hunter's Roll
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
	local effectpowers = {10, 13, 15, 40, 18, 20, 25, 5, 27, 30, 50, 5}
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_RNG) ) then
		effectpower = effectpower + 15;
	end

	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_HUNTERS_ROLL, effectpower, 0, duration, target:getID(), total, MOD_ACC) == false) then
		ability:setMsg(423);
	end
end;