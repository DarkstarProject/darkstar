---------------------------------------------
-- Thunderstrike
--
-- Description: Deals Lightning damage in an area of effect. Additional effect: Stun
-- Type: Magical
-- Ignores Shadows
-- Range: 13' radial
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1805) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 4;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 3,ELE_LIGHTNING,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;