---------------------------------------------
--  Mysterious Light
--
--  Description: Deals wind damage to enemies within range. Additional effect: Weight.
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    -- can only used if not silenced
    if(mob:getMainJob() == JOB_BRD and mob:hasStatusEffect(EFFECT_SILENCE) == false) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_WEIGHT;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 50));

    return typeEffect;
end;
