---------------------------------------------------
-- Floodlight
--
-- Description:  ~300 magic damage, Flash, Blind and Silence, ignores Utsusemi
-- Type: Magical
--
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local currentForm = mob:getLocalVar("form"); -- Proto-Omega's script sets this.

    if (mob:AnimationSub() == 2 and currentForm == 1) then -- omega first bipedform
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_LIGHT,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_IGNORE_SHADOWS);

    MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 15, 3, 120);
    MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, 60);

    target:delHP(dmg);
    return dmg;
end;