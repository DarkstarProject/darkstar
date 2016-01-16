---------------------------------------------
--  Hex Eye
--
--  Description: Paralyzes with a gaze.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Line of sight
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

    local message = MSG_MISS;
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 25, 0, 120));

    return typeEffect;

end;