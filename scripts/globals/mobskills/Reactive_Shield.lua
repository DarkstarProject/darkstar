---------------------------------------------
--  Reactive Shield
--
--  Description: Covers the user in shock spikes. Enemies that hit it take lightning damage.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local power = 20;
    local duration = 180;
    local typeEffect = EFFECT_SHOCK_SPIKES;
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 180));
    return typeEffect;
end;
