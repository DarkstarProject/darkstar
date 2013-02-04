---------------------------------------------
--  Petribreath
--
--  Description: Petrifies targets within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown  cone, Seen up to 15' distance.
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
	local message = MSG_MISS;
	local typeEffect = EFFECT_PETRIFICATION;
	if(target:hasStatusEffect(typeEffect) == false) then
			local statmod = MOD_INT;
			local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_EARTH);
			if(resist > 0.2) then
				message = MSG_ENFEEB_IS;

				local power = math.random(10, 20) + mob:getMainLvl()/3;
				target:addStatusEffect(typeEffect,1,0,power);--power=1;tic=0;duration=30;
			end
	else
		message = MSG_NO_EFFECT;
	end
	return typeEffect;
end;
