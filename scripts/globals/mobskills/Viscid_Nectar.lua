---------------------------------------------
--  Viscid Nectar
--
--  Description: Sprays a sticky nectar in a fan-shaped area, inflicting slow.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Slow is equivalent to Slow II.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
	
    power = 2;
    tic = 0;
    duration = 120;

    isEnfeeble = true;
    typeEffect = EFFECT_SLOW;
    statmod = MOD_INT;
    
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,power,tic,duration);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end
    return typeEffect;

end;