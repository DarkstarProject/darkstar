---------------------------------------------------
-- Hexagon Belt
-- Enhances defense by 20%.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:hasStatusEffect(EFFECT_DEFENSE_BOOST)) then
        return 1;
    end
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    skill:setMsg(MSG_BUFF);
    local typeEffect = EFFECT_DEFENSE_BOOST;
    mob:delStatusEffect(EFFECT_DEFENSE_DOWN);
    mob:delStatusEffect(typeEffect);
    mob:addStatusEffect(typeEffect,20,0,120);
    return typeEffect;
end;
