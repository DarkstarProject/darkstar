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
    
    mob:delStatusEffect(EFFECT_DEFENSE_DOWN);
    mob:delStatusEffect(EFFECT_MAGIC_DOWN);
    mob:delStatusEffect(EFFECT_MAGIC_DEF_BOOST);
    mob:delStatusEffect(EFFECT_DEFENSE_BOOST);
    mob:addStatusEffect(EFFECT_DEFENSE_BOOST,30,0,60);
    mob:addStatusEffect(EFFECT_MAGIC_DEF_BOOST,30,0,60);
    return EFFECT_DEFENSE_BOOST;
end;
