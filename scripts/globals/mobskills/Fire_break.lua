---------------------------------------------
-- Fire Break
-- Family: Wamoura
-- Description: Deals heavy Fire damage to targets in front. 
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Front cone
-- Notes: Only used by notorious monsters. 
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 1.7;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*8,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;