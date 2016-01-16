---------------------------------------------
--  Laser_Shower
--
--  Description: Deals Darkness damage to enemies within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local currentForm = mob:getLocalVar("form") -- this var is only set for proto-omega

    if (currentForm == 2) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.2, 1.25, ELE_DARK, 1600);
    local dis = ((mob:checkDistance(target)*2) / 20);

    dmgmod = dmgmod * dis;
    dmgmod = utils.clamp(dmgmod, 50, 1600);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;