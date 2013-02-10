---------------------------------------------------
-- Sand Pit
-- Single target bind
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local message = MSG_MISS;
    local typeEffect = EFFECT_BIND;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_EARTH);
        if(resist > 0.1) then
            local mobTP = mob:getTP();
            local duration = mob:getMainLvl()/3.75;
            if(mobTP <= 100) then
                duration = 10 + duration;
            elseif(mobTP <= 200) then
                duration = 15 + duration;
            else
                duration = 20 + duration;
            end
            message = MSG_ENFEEB_IS;
            target:addStatusEffect(typeEffect,1,0,duration*resist);
        end
    else
        message = MSG_NO_EFFECT;
    end

    skill:setMsg(message);
    return typeEffect;
end;
