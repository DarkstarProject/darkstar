---------------------------------------------
--  Lead Breath
--
--  Description: Weighs down players.
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_WEIGHT;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 300));

    return typeEffect;
end;
