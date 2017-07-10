---------------------------------------------------
-- Barrier Tusk
-- Enhances defense and magic defense
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    MobBuffMove(mob, EFFECT_MAGIC_DEF_BOOST, 30, 0, 60);
    skill:setMsg(MobBuffMove(mob, EFFECT_DEFENSE_BOOST, 30, 0, 60));

    return EFFECT_DEFENSE_BOOST;
end;
