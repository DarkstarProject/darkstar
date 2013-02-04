---------------------------------------------------
-- Poison Sting
-- Induces poison
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_POISON;
    local message = MSG_MISS;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WATER);
        if(resist > 0.2) then
            message = MSG_ENFEEB_IS;
            target:addStatusEffect(typeEffect,5,1,180*resist);
        end
    else
        message = MSG_NO_EFFECT;
    end

    skill:setMsg(message);
    return typeEffect;
end;
