---------------------------------------------
-- Tourbillion
--
-- Description: Delivers an area attack. Additional effect duration varies with TP. Additional effect: Weakens defense.
-- Type: Physical
-- Shadow per hit
-- Range: Unknown range
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1805) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3;
    local accmod = 1;
    local dmgmod = 1.5;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    local duration = 20 * (skill:getTP() / 100);

    MobPhysicalStatusEffectMove(mob, target, skill, EFFECT_DEFENSE_DOWN, 20, 0, duration);
    target:delHP(dmg);

    return dmg;
end;