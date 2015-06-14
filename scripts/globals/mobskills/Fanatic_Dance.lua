---------------------------------------------------
-- Sandstorm
-- Kicks up a blinding dust cloud on targets in an area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	if(mob:isInDynamis() and mob:isMobType(MOBTYPE_NOTORIOUS)) then
		return 0;
	end
	return 1;
end;

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_CHARM_I;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60));

    mob:resetEnmity(target);

	return typeEffect;
end
