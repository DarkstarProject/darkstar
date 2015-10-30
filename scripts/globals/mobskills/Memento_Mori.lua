---------------------------------------------------
-- Memento Mori
-- Enhances Magic Attack.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MAGIC_ATK_BOOST;
    skill:setMsg(MobBuffMove(mob, typeEffect, 20, 0, 300));
    return typeEffect;
end;
