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
	local effectpowers = {13, 55, 17, 20, 25, 8, 30, 35, 40, 45, 65, 25}
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_BRD) ) then
		effectpower = effectpower + 25;
	end

	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CHORAL_ROLL, effectpower, 0, duration, target:getID(), total, MOD_SPELLINT) == false) then
		ability:setMsg(423);
	end
end;