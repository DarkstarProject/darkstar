---------------------------------------------
-- Gloeosuccus
-- Enfeebling
-- Description: Slows down a single target.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(MobStatusEffectMove(mob, target, dsp.effects.SLOW, 128, 0, 180));

    return dsp.effects.SLOW;
end;
