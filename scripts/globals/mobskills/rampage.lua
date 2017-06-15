---------------------------------------------
--  Rampage
--
--  Description: Delivers a five-hit attack. Chance of critical varies with TP.
--  Type: Physical
--  Number of hits
--  Range: Melee
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:messageBasic(43, 0, 684+256);
    skill:setSkillchain(69);
    
    local numhits = 5;
    local accmod = 1;
    local dmgmod = 1.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1,1.5,2);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    -- Witnessed 1100 to a DD.  Going with it :D
   target:delHP(dmg);
    return dmg;
end;
