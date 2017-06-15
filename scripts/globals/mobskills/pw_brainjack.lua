---------------------------------------------------
-- BrainJack
--
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1825) then
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

    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_CHARM_I, 0, 0, 60);
    target:delHP(dmg);

    return dmg;
end;