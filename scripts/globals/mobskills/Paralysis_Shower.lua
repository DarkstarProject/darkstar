---------------------------------------------------
-- Paralysis Shower
-- Range: 10' cone
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(target:hasStatusEffect(EFFECT_PARALYSIS) == false) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;

    skill:setMsg(MSG_ENFEEB_IS);
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
        if(resist > 0.2) then
            target:addStatusEffect(typeEffect,25,0,120*resist);--power=1;tic=0;duration=60;
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end

    return typeEffect;
end;
