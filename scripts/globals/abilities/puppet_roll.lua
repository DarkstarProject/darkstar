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
	local effectpowers = {4, 5, 18, 7, 9, 10, 2, 11, 13, 15, 22, 8}
	local effectpower = effectpowers[total]
	if (total < 12 and caster:hasPartyJob(JOB_PUP) ) then --lolpup
		effectpower = effectpower + 8;
	end

	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_PUPPET_ROLL, effectpower, 0, duration, target:getID(), total, MOD_PET_MACC) == false) then
		ability:setMsg(423);
	end
end;