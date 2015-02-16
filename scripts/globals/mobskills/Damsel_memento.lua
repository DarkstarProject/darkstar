---------------------------------------------------
--  Catharsis
--
--  Description: Restores HP.
--
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
   --if (mob:hasStatusEffect(EFFECT_HUNDRED_FISTS)) then
	--	return 1;
	--else

	   return 0;

--end
   -- return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    local potency = skill:getParam();

local typeEffect = EFFECT_HUNDRED_FISTS;
 	local power = 1;
	local duration = 240;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 0, duration);

    if(potency == 0) then
    	potency = 20;
    end

    potency = potency - math.random(0, potency/4);

    skill:setMsg(MSG_SELF_HEAL);

    return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
