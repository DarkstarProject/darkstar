---------------------------------------------
--  Curse
--
--  Description: Inflicts a curse on all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15' radial 
--  Notes: Curse has a very long duration. 
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 1;
    tic = 0;
    duration = 360;

    isEnfeeble = true;
    typeEffect = EFFECT_CURSE_I;
    statmod = MOD_INT;
    accrand = math.random(1,2);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
	
    if(resist > 0.7) then         
	duration = duration - (duration/3);
    end
	
    if(resist > 0.5 and accrand == 1) then
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