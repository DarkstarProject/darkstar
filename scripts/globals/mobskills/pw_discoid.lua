---------------------------------------------
-- Discoid
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1825) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local needles = 10000 / skill:getTotalTargets();
    local dmg = MobFinalAdjustments(needles,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);

    target:delHP(dmg);

    return dmg;
end;