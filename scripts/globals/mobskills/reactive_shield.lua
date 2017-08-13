---------------------------------------------
--  Reactive Shield
--
--  Description: Covers the user in shock spikes. Enemies that hit it take lightning damage.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
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
    local power = math.random(20, 30);
    local duration = 180;
    local typeEffect = EFFECT_SHOCK_SPIKES;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 180));
    return typeEffect;
end;
