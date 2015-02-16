---------------------------------------------------
-- Charm enemy
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	local chance = math.random(10);
	if (chance == 1) then
		return 0;
	else 
		return 1;
	end
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_CHARM_I;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60));

    mob:resetEnmity(target);
	return typeEffect;
end
