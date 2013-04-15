-----------------------------------
-- Ability: Weapon Bash
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (not player:isWeaponTwoHanded()) then
		return MSGBASIC_NEEDS_2H_WEAPON,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	-- Applying Weapon Bash stun. Rate is said to be near 100%, so let's say 99%.
	if(math.random()*100 < 99) then
		target:addStatusEffect(EFFECT_STUN,1,0,6);
	end
	
	-- Weapon Bash deals damage dependant of Dark Knight level
	local darkKnightLvl = 0;
	if(player:getMainJob()==JOB_DRK) then
		darkKnightLvl = player:getMainLvl();	-- Use Mainjob Lvl
	elseif(player:getSubJob()==JOB_DRK) then
		darkKnightLvl = player:getSubLvl();	-- Use Subjob Lvl
	end
	
	-- Calculating and applying Weapon Bash damage
	local damage = math.floor(((darkKnightLvl + 11) / 4) + player:getMod(MOD_WEAPON_BASH));
	target:delHP(damage);
	target:updateEnmityFromDamage(player,damage);
end;
