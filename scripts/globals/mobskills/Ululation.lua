---------------------------------------------
-- Ululation
-- Paralyzes all enemies in an area of effect.
--
---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, math.random(40,70), 0, 120));

	return typeEffect;
end
