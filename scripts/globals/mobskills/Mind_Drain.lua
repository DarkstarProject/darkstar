---------------------------------------------------
-- Mind Drain
-- Steals mnd from target
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_MND_DOWN;

    local statmod = MOD_INT;
    local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WATER);
    if(resist > 0.2) then
        skill:setMsg(334);
        target:delStatusEffect(typeEffect);
        target:addStatusEffect(typeEffect,10,0,120*resist);
        mob:delStatusEffect(EFFECT_MND_BOOST);
        mob:addStatusEffect(EFFECT_MND_BOOST, 10, 0, 120);
    else
        skill:setMsg(MSG_MISS); -- resist !
    end
    return typeEffect;
end;
