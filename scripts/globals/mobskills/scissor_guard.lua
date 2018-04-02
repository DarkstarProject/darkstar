---------------------------------------------
-- Scissor Guard
-- Enhances defense 100%.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.DEFENSE_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 60));
    return typeEffect;
end;
