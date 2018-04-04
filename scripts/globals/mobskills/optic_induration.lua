---------------------------------------------
--  Optic Induration
--
--  Description: Charges up a powerful, calcifying beam directed at targets in a fan-shaped area of effect. Additional effect: Petrification &amp; enmity reset
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Charges up (three times) before actually being used (except Jailer of Temperance, who doesn't need to charge it up). The petrification lasts a very long time.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 2 or mob:AnimationSub() == 3) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.PETRIFICATION;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60);

    local dmgmod = 1;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    mob:resetEnmity(target);

    return dmg;

end;
