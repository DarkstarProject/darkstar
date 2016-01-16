---------------------------------------------
-- Thundris Shriek
--
-- Description: Deals heavy lightning damage to targets in area of effect. Additional effect: Terror
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown
-- Notes: Players will begin to be intimidated by the dvergr after this attack.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
  if(mob:getFamily() == 316) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1839) then
        return 0;
    else
        return 1;
    end
  end


  if(mob:getFamily() == 91) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1840) then
        return 0;
    else
        return 1;
    end
  end

  return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_TERROR;

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 15);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,ELE_THUNDER,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
