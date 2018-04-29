---------------------------------------------
-- Barrier Tusk
-- Enhances defense and magic defense
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    MobBuffMove(mob, dsp.effect.MAGIC_DEF_BOOST, 30, 0, 60);
    skill:setMsg(MobBuffMove(mob, dsp.effect.DEFENSE_BOOST, 30, 0, 60));

    return dsp.effect.DEFENSE_BOOST;
end;
