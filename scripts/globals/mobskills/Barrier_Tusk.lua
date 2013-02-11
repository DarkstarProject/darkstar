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
    skill:setMsg(MSG_BUFF);
    local typeEffect = EFFECT_DEFENSE_BOOST;
    mob:delStatusEffect(EFFECT_DEFENSE_DOWN);
    mob:delStatusEffect(EFFECT_MAGIC_DOWN);
    mob:delStatusEffect(EFFECT_MAGIC_BOOST);
    mob:delStatusEffect(typeEffect);
    mob:addStatusEffect(typeEffect,30,0,60);
    mob:addStatusEffect(EFFECT_MAGIC_BOOST,30,0,60);
    return typeEffect;
end;
