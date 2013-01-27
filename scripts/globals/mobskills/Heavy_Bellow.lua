---------------------------------------------
--  Heavy Bellow
--
--  Description: Additional effect: "Stun."
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local typeEffect = EFFECT_STUN;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,6);
        if(resist > 0.2) then
            target:addStatusEffect(typeEffect,1,0,math.random(8,12));--power=1;tic=0;duration=5;
        else
            skill:setMsg(MSG_MISS); -- resist !
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end

    target:delHP(dmg);
    return dmg;
end;
