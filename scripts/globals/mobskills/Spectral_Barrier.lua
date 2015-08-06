---------------------------------------------
--  Spectral Barrier
--
--  Description: Magic shield
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MAGIC_SHIELD;

    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, 60));
    return typeEffect;
end;
