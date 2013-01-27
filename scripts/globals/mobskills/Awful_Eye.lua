---------------------------------------------------
-- Awful Ere
-- 15' Reduces STR of players in area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STR_DOWN;
    local statmod = MOD_INT;
    local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
    if(resist > 0.2) then
        skill:setMsg(MSG_ENFEEB_IS);
        target:addStatusEffect(typeEffect,50,0,120);
    else
        skill:setMsg(MSG_MISS); -- resist !
    end
    return typeEffect;
end;
