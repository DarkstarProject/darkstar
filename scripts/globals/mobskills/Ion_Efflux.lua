---------------------------------------------------
--  Ion_Efflux
--
--  Description: 10'(?) cone  Paralysis, ignores Utsusemi
--  Type: Magical
--  
--  Range: 10 yalms
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() <= 1) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 60));

    return typeEffect;
end