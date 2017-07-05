---------------------------------------------
-- Spring Breeze
--
-- Description: AoE TP-Reduction and Sleep effect.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(MobStatusEffectMove(mob, target, EFFECT_SLEEP_I, 1, 0, 20));
    target:setTP(target:getTP() * 0.5);

    return EFFECT_SLEEP_I;
end;
