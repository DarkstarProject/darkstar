---------------------------------------------
--  Mortal Ray
--
--  Description: Inflicts Doom upon an enemy.
--  Type: Magical (Dark) 
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
    power = 1;
    tic = 0;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_DOOM;
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