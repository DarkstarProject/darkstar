---------------------------------------------------
-- Scissor Guard
-- Enhances defense 100%.
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
    mob:delStatusEffect(typeEffect);
    mob:delStatusEffect(EFFECT_DEFENSE_DOWN);
    mob:addStatusEffect(typeEffect,100,0,60); -- 100%
    return typeEffect;
end;
