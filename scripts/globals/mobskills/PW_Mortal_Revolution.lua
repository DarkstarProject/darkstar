---------------------------------------------
-- Mortal Revolution
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- See PW's script
    local phase = mob:getLocalVar("phase");

    if (phase == 8) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    
    if (info.hitslanded > 0) then
        local typeEffect = EFFECT_STUN;
        local duration = math.random(3,5);
        MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration);
    end
    
    target:delHP(dmg);
    return dmg;
end;
