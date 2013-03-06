-----------------------------------
-- Ability: Choral Roll
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
	local effectpowers = {1, 1, 1, 1, 3, 2, 2, 2, 1, 3, 4, 1}
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_SMN) ) then
		effectpower = effectpower + 1;
	end

	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_EVOKERS_ROLL, effectpower, 0, duration, target:getID(), total, MOD_REFRESH) == false) then
		ability:setMsg(423);
	end
end;