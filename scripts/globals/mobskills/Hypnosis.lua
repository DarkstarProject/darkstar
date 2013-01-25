---------------------------------------------------
-- Slumber Powder
-- 10' Conal sleep
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SLEEP_I;
    if(target:hasStatusEffect(typeEffect) == false and target:isUndead() == false and target:isFacing(mob)) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
        if(resist > 0.1) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,1,0,math.random(20, 30));

            -- reset hate so I don't wake him up
            mob:resetEnmity(target);
        else
            skill:setMsg(MSG_MISS); -- resist !
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;
