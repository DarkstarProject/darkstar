---------------------------------------------------
-- Vulcan Shot
--
-- Description: Fires an explosive bullet at targets in an area of effect.
-- Type: Magical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: Wipes shadows?
-- Range: 14' radial
---------------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(43, 0, 254);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 8;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);

    -- skill:setSkillchain(254);

    target:delHP(dmg);
    return dmg;
end;
