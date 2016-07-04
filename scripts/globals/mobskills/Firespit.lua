---------------------------------------------
--  Firespit
--
--  Description: Deals fire damage to an enemy.
--  Type: Magical (Fire)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
  if(mob:getFamily() == 91) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1639) then
        return 0;
    else
        return 1;
    end
  end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
