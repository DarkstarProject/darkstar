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
	local effectpowers = {8, 32, 10, 12, 14, 4, 16, 20, 22, 24, 40}
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_SAM) ) then
		effectpower = effectpower + 10;
	end

	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_SAMURAI_ROLL, effectpower, 0, duration, target:getID(), total, MOD_STORETP) == false) then
		ability:setMsg(423);
	end
end;