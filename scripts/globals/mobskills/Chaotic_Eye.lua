---------------------------------------------
--  Chaotic Eye
--
--  Description: Silences an enemy.
--  Type: Magical (Wind)
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
    local typeEffect = EFFECT_SILENCE;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 1, 0, 120));

    return typeEffect;
end;
