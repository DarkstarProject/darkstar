---------------------------------------------
--  Stormwind
--
--  Description: Creates a whirlwind that deals Wind damage to targets in an area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
-- onMobSkillCheck
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

---------------------------------------------
-- onMobWeaponSkill
---------------------------------------------

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;

	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WIND,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
	
	if (mob:getName() == "Kreutzet") then
		if (mob:actionQueueAbility() == true) then		
			if (mob:getLocalVar("Stormwind") == 0) then
				mob:setLocalVar("Stormwind", 1); 
				dmgmod = 1.25;
				info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WIND,dmgmod,TP_NO_EFFECT);
				dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
			elseif (mob:getLocalVar("Stormwind") == 1) then
				mob:setLocalVar("Stormwind", 0); 
				dmgmod = 1.6;
				info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WIND,dmgmod,TP_NO_EFFECT);
				dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
			end
		elseif (mob:actionQueueAbility() == false) then	
			for i = 0, 1 do -- Stormwind 3 times per use. Gets stronger each use. 
                -- TODO: Should be some sort of delay here between ws's..
				mob:useMobAbility(670);
				mob:setLocalVar("Stormwind", 0); 
			end
		end
	end

	target:delHP(dmg);
	return dmg;
end;
