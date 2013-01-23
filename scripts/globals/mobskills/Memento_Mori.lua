---------------------------------------------------
-- Cocoon
-- Enhances defense.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    skill:setMsg(MSG_BUFF);
    local typeEffect = EFFECT_MAGIC_ATK_BOOST;
    mob:delStatusEffect(EFFECT_MAGIC_ATK_DOWN);
    mob:delStatusEffect(typeEffect);
    mob:addStatusEffect(typeEffect,20,0,30); -- 50%
    return typeEffect;
end;
