-----------------------------------
-- Ability: Chaos Roll
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	local effectID = getCorsairRollEffect(ability:getID());
	if (player:hasStatusEffect(effectID) or player:hasBustEffect(effectID)) then
		return MSGBASIC_ROLL_ALREADY_ACTIVE,0;
	else
		return 0,0;
	end
end;

function OnUseAbilityRoll(caster, target, ability, total)

	local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
	local effectpowers = {6, 8, 9, 25, 11, 13, 16, 3, 17, 19, 31, 10}
	local effectpower = effectpowers[total];
	if (total < 12 and caster:hasPartyJob(JOB_DRK) ) then
		print("testin\n");
		effectpower = effectpower + 10;
	end
	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CHAOS_ROLL, effectpower, 0, duration, target:getID(), total, MOD_ATTP) == false) then
		ability:setMsg(423);
	end
end;