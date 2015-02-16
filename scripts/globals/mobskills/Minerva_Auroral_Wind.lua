---------------------------------------------
-- Auroral Wind (Minerva Custom Version)
--
-- Deals Wind damage to targets in a fan-shaped area.
-- Additional effect: Inflicts Sleep2, Amnesia, or Gradual Petrify on target.
-- Additional effect: Inflicts Ppotent Dia effect on target.
-- Additional effect: Grants Minerva Light Spikes 
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local RandomValue = math.random(0,99);
    local dmgmod = 1;
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    if (RandomValue <= 33) then
        MobStatusEffectMove(mob, target, EFFECT_SLEEP_II, 1, 0, math.random(30,60));
    elseif (RandomValue <= 66) then
        MobStatusEffectMove(mob, target, EFFECT_AMNESIA, 1, 0, math.random(10,20));
    else
        MobStatusEffectMove(mob, target, EFFECT_GRADUAL_PETRIFICATION, 1, 0, 60);
    end
    mob:addStatusEffect(EFFECT_REPRISAL, 10, 0, 600);
    MobStatusEffectMove(mob, target, EFFECT_DIA, 25, 0, 60, 50);
    target:delHP(dmg);
    return dmg;
end;