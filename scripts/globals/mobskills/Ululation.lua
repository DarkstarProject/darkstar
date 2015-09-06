---------------------------------------------
-- Ululation
-- Paralyzes all enemies in an area of effect.
--
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == true) then
        return 1;
    else
        return 0;
    end;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, math.random(40,70), 0, 120));

    return typeEffect;
end
