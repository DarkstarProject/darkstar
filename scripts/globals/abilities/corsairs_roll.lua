-----------------------------------
-- Ability: Corsair's Roll
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	local effectID = getCorsairRollEffect(ability:getID());
	if (player:hasStatusEffect(effectID) or player:hasBustEffect(effectID)) then
		return MSGBASIC_ROLL_ALREADY_ACTIVE,0;
	else
		return 0,0;
	end
end;

function onUseAbilityRoll(caster, target, ability, total)
	local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK)
	local effectpowers = {10, 11, 11, 12, 20, 13, 15, 16, 8, 17, 24, 6};
	local effectpower = effectpowers[total];
	if (caster:getMainJob() == JOB_COR and caster:getMainLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
	elseif (caster:getSubJob() == JOB_COR and caster:getSubLvl() < target:getMainLvl()) then
		effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
	end
	if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CORSAIRS_ROLL, effectpower, 0, duration, target:getID(), total, MOD_EXP_BONUS) == false) then
		ability:setMsg(423);
	end
end;