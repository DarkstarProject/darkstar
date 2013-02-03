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
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_BIND;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_ICE);
		if(resist > 0.2) then
			local mobTP = skill:getTP();
			local duration = 25;
			if(mobTP <= 100) then
				duration = duration + 5;
			elseif(mobTP <= 200) then
				duration = duration + 10;
			elseif(mobTP <= 300) then
				duration = duration + 15;
			end

			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,1,0,duration);--power=1;tic=0;
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
