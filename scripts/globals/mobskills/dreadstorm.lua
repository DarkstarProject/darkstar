---------------------------------------------
-- Dreadstorm
--
-- Description: Deals magical damage in an area of effect. Additional effect: Terror
-- Type: Magical
-- Wipes Shadows
-- Range: 13' radial
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
  if (mob:getFamily() == 316) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1805) then
        return 0;
    else
        return 1;
    end
  end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.TERROR;
    local duration = 10;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, duration));

    local dmgmod = 2.5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
