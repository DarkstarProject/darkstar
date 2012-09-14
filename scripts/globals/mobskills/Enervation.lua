---------------------------------------------
--  Enervation
--
--  Description: Lowers the defense and magical defense of enemies within range.
--  Type: Magical (Dark)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
    power = 20;
    tic = 0;
    duration = 120;

    isEnfeeble = true;
    typeEffect = EFFECT_DEFENSE_DOWN;
    statmod = MOD_INT;
    
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,power,tic,duration);
			target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN,power,tic,duration);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end
	
    return typeEffect;
end;