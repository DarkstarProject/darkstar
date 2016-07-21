---------------------------------------------------
-- BrainJack
--
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- See PW's script
    local phase = mob:getLocalVar("phase");

    if (phase == 6) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 2.3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    
    if (info.hitslanded > 0) then
        local typeEffect = EFFECT_CHARM_I;
        local power = 0;
        if (not target:isPC()) then
            skill:setMsg(MSG_MISS);
            return dmg;
        end
        local msg = MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, 60);
        if (msg == MSG_ENFEEB_IS) then
            mob:charm(target);
        end
        skill:setMsg(msg);
    end
    
    target:delHP(dmg);
    return dmg;
end;