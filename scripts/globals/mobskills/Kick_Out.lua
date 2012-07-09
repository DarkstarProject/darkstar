---------------------------------------------
--  Kick Out
--
--  Description: Deals heavy damage and inflicts blind to any target behind user.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown cone, backwards
--  Notes:  Only used when the Behemoth is attacking with it's tail.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
    --[[
	numhits = 1;
    accmod = 1;
    dmgmod = 1;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
    return dmg;]]
	
end;