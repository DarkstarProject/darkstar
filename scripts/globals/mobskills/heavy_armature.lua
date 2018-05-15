---------------------------------------------------
-- Heavy Armature
-- Adds buffs Haste, Shell, Protect, Blink
---------------------------------------------------
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    MobBuffMove(mob, dsp.effects.HASTE, 25, 0, 180);
    MobBuffMove(mob, dsp.effects.SHELL, 100, 0, 180);
    MobBuffMove(mob, dsp.effects.PROTECT, 100, 0, 180);
    skill:setMsg(MobBuffMove(mob, dsp.effects.BLINK, math.random(10,25, 0, 120)));

    return dsp.effects.BLINK;
end;