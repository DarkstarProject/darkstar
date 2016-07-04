---------------------------------------------------
-- Tremors
-- Deals Earth damage with a seismic disturbance. Additional effect: DEX Down
-- Area of Effect is centered around caster.
-- Utsusemi/Blink absorb: Wipes shadows
-- Duration: Three minutes ?
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DEX_DOWN;

    MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_EARTH,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
