---------------------------------------------------
-- Barrier Tusk
-- Enhances defense and magic defense
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    MobBuffMove(target, EFFECT_MAGIC_DEF_BOOST, 30, 0, 60);
    skill:setMsg(MobBuffMove(target, EFFECT_DEFENSE_BOOST, 30, 0, 60));

    return EFFECT_DEFENSE_BOOST;
end;
