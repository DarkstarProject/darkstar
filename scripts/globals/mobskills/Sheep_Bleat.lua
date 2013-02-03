---------------------------------------------------
-- Sheep Bleat
-- Emits a unnerving bleat that slows down players in range.
--
--  Only used by Nightmare Sheep from Dynamis-Valkurm
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 1; -- The mob that uses this is not in database yet so returns 1 , when mob is added to game do a check for mob ID and return 0 if it matches nightmare sheep
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_SLOW;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WND);
		if(resist > 0.2) then
			skill:setMsg(MSG_ENFEEB_IS);
            target:delStatusEffect(EFFECT_HASTE);
			target:addStatusEffect(typeEffect,30,0,120); -- 30% ? power=30;tic=0;duration=120;
		else
			skill:setMsg(MSG_MISS); -- resist !
		end
	else
		skill:setMsg(MSG_NO_EFFECT); -- no effect
	end
	return typeEffect;
end;
