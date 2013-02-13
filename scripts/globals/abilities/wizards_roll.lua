-----------------------------------
-- Ability: Choral Roll
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbilityRoll(caster, target, ability, total)
	local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
	local effectpowers = {2, 3, 4, 4, 10, 5, 6, 7, 1, 7, 12, 4};
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_BLM) ) then
		effectpower = effectpower + 3;
	end

	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_WIZARDS_ROLL, effectpower, 0, duration, target:getID(), total, MOD_MATT) == false) then
		ability:setMsg(423);
	end
end;