---------------------------------------------
-- Tyrranic Blare
--
-- Description: Emits an overwhelming scream that damages nearby targets.
-- Type: Magical?
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Less than or equal to 10.0
-- Notes: Only used by Gulool Ja Ja.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1863) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.8,ELE_EARTH,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;