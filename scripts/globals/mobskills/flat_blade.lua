---------------------------------------------
--  Flat Blade
--
--  Description: Delivers a four-hit attack. Chance of critical varies with TP. 
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/Qubia_Arena/TextIDs");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
skill:setMsg(0)
target:showText(mob,FLAT_PREPARE);
  return 0;
end;

function onMobWeaponSkill(target, mob, skill)
skill:setMsg(0)
target:showText(mob,FLAT_LAND);


    skill:setSkillchain(40);
    
    local numhits = 4;
    local accmod = 1;
    local dmgmod = 1.25;
   local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.1,1.2,1.3);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    -- AA EV: Approx 900 damage to 75 DRG/35 THF.  400 to a NIN/WAR in Arhat, but took shadows.
   target:delHP(dmg);
return dmg;
end;
