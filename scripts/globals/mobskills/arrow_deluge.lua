---------------------------------------------
--  Arrow Deluge
--
--  Description: Delivers a threefold ranged attack to targets in an area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown
--  Notes: Used only by Lamia equipped with a bow. If they lost their bow, they'll use Hysteric Barrage instead.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,MOBPARAM_3_SHADOW);
    target:delHP(dmg);
    return dmg;
end;
