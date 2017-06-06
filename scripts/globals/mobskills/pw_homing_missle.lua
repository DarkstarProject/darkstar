---------------------------------------------------
-- Homing Missle
--
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1825) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local targetcurrentHP = target:getHP();
    local targetmaxHP = target:getMaxHP();
    local hpset=targetmaxHP*0.20;
    local typeEffect = EFFECT_BIND;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30);

    if (targetcurrentHP > hpset) then
        dmg= targetcurrentHP - hpset;
    else
        dmg=0;
    end

    target:delHP(dmg);
    return dmg;
end