---------------------------------------------
--  Typhoon
--
--  Description: Spins around dealing damage to targets in an area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-4 shadows
--  Range: 10' radial
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 4;
    local accmod = 1;
    local dmgmod = 0.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);

    if (mob:getName() == "Faust") then
        if (mob:getLocalVar("Typhoon") == 0) then
            mob:useMobAbility(539);
            mob:setLocalVar("Typhoon", 1); 
        else
            mob:setLocalVar("Typhoon", 0); 
        end    
    end    

    return dmg;
end;
