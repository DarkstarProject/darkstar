require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local zone = mob:getZoneID();
    if(mob:isInDynamis() or zone == 5) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1.2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,1.2,1.5);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_STUN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 6);

    target:delHP(dmg);
    return dmg;
end;
