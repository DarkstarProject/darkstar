---------------------------------------------------
-- Sand Blast
-- Deals Earth damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 8' cone
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;
    local message = MSG_MISS;
    if(target:hasStatusEffect(typeEffect) == false) then --Let's first see if it's worth the time to do this math, since there's no messages to handle
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
        if(resist > 0.1) then
            message = MSG_ENFEEB_IS;
            target:addStatusEffect(typeEffect,25,0,60*resist);--power=1;tic=0;duration=60;
        end
    else
        message = MSG_NO_EFFECT;
    end
    skill:setMsg(message);

    return typeEffect;
end;
