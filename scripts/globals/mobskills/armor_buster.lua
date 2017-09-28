---------------------------------------------------
--  Armor_Buster
--  Description: 
--  Type: Magical
--  additional effect :WEIGHT

---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local phase = mob:getLocalVar("battlePhase");

    if (phase >= 3) then -- only proto-ultima has the var at a value other than 0. Note that the phase values range from 0-4 for the five phases.
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_WEIGHT;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 3, 45);
    local dmgmod = 2.5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WATER,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
