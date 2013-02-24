---------------------------------------------------
-- Blank Gaze
-- Powerful Paralyze Gaze Attack.
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MobGazeMove(mob, target, typeEffect, 35, 0, 60));

    return typeEffect;
end
