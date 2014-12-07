---------------------------------------------
--  red lotus blade
--
--  Description: Delivers a four-hit attack. Chance of critical varies with TP. 
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/zones/Qubia_Arena/TextIDs");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
target:showText(mob,RLB_PREPARE);
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
target:showText(mob,RLB_LAND);
skill:setSkillchain(40);
    
	local numhits = 4;
	local accmod = 1;
	local dmgmod = 1.25;
   local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.1,1.2,1.3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);


   target:delHP(dmg);
return dmg;
end;
