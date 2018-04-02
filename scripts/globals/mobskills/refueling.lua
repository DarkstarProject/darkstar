---------------------------------------------
-- Refueling
-- Increases attack speed.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.HASTE;
    skill:setMsg(MobBuffMove(mob, typeEffect, 102, 0, 300));
    return typeEffect;
end
