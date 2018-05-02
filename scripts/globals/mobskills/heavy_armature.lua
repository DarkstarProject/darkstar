---------------------------------------------------
-- Heavy Armature
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local shell = dsp.effects.SHELL;
    local power = 100;
    local protect = dsp.effects.PROTECT;
	local blink = dsp.effects.BLINK;
	local shadow = math.random(10,25);

    skill:setMsg(MobBuffMove(mob, shell, power, 0, 180));
    skill:setMsg(MobBuffMove(mob, protect, power, 0, 180));
    skill:setMsg(MobBuffMove(mob, blink, shadow, 0, 120));
    skill:setMsg(MobBuffMove(mob, dsp.effects.HASTE, 25, 0, 180));

    return protect;
end;