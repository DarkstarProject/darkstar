---------------------------------------------------
-- Impact Roar
-- Emits the roar of an impact event, dealing damage in a fan-shaped area of effect.
-- Ignores Shadows
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,dsp.magic.ele.WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
