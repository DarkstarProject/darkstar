---------------------------------------------------
-- Ice Break
-- Deals ice damage to enemies within range. Additional Effect: "Bind."
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.BIND;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_ICE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
