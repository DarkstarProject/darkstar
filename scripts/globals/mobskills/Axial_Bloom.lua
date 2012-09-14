---------------------------------------------
--  Axial Bloom
--
--  Description: Attempts to bind nearby targets with petals.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)


    power = 1;
    tic = 0;
	
	if(skill:getTP()<=100) then
		tpBonus = 5;
	elseif(skill:getTP() <=200) then
		tpBonus = 10;
	elseif(skill:getTP() <= 300) then
		tpBonus = 15;
	end
	
    duration = 25 + tpBonus;

    isEnfeeble = true;
    typeEffect = EFFECT_BIND;
    statmod = MOD_INT;
    
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
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