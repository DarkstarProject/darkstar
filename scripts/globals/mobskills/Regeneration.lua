---------------------------------------------
--  Regeneration
--
--  Description: Adds a Regen effect.
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
    local power = mob:getMainLvl()/10 * 4 + 5;
    local duration = 60;

    local typeEffect = EFFECT_REGEN;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 3, duration));
    return typeEffect;
end;
