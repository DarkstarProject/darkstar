-----------------------------------
-- Ability: Drachen Roll
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbilityRoll(caster, target, ability, total)
	local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
	local effectpowers = {10, 13, 15, 40, 18, 20, 25, 5, 28, 30, 50, 15}
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_DRG) ) then
		effectpower = effectpower + 15;
	end

	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_DRACHEN_ROLL, effectpower, 0, duration, target:getID(), total, MOD_PET_ACC) == false) then
		ability:setMsg(423);
	end
end;