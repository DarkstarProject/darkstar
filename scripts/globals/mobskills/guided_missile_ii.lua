---------------------------------------------------
--  Guided_Missile_II
--
--  Description: ~475 magic damage, ignores Utsusemi
--  Type: Magical
--  
--  Range: 5 yalms
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local currentForm = mob:getLocalVar("form");

    if (mob:AnimationSub() == 2 and currentForm == 1) then -- proto-omega first bipedform
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
