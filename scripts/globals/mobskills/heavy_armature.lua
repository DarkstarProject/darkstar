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
    MobBuffMove(mob, dsp.effect.HASTE, 25, 0, 180);
    MobBuffMove(mob, dsp.effect.SHELL, 100, 0, 180);
    MobBuffMove(mob, dsp.effect.PROTECT, 100, 0, 180);
    skill:setMsg(MobBuffMove(mob, dsp.effect.BLINK, math.random(10,25, 0, 120)));

    return dsp.effect.BLINK;
end;
