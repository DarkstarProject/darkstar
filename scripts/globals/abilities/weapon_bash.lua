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
	
	-- Several pieces of equipment also increase Weapon Bash damage
	local equipmentBonus = 0;
	-- Smithing Scythe
	if(player:getEquipID(SLOT_MAIN)==18957) then
		equipmentBonus = equipmentBonus + 8;
	end
	-- Smithing Scythe + 1
	if(player:getEquipID(SLOT_MAIN)==18960) then
		equipmentBonus = equipmentBonus + 10;
	end
	-- Crude Sword
	if(player:getEquipID(SLOT_MAIN)==18389) then
		equipmentBonus = equipmentBonus + 15;
	end
	-- Slayer's Ring (latent effect)
	if((player:getEquipID(SLOT_RING1)==13293) or (player:getEquipID(SLOT_RING2)==13293)) then
		if((player:getHPP() < 75) and (player:getTP() < 100)) then
			equipmentBonus = equipmentBonus + 10;
		end
	end
	-- Chaos Gauntlets (or +1)
	if((player:getEquipID(SLOT_HANDS)==13968) or (player:getEquipID(SLOT_HANDS)==14897)) then
		equipmentBonus = equipmentBonus + 10;
	end
	-- Knightly Earring
	if((player:getEquipID(SLOT_EAR1)==14758) or (player:getEquipID(SLOT_EAR2)==14758)) then
		equipmentBonus = equipmentBonus + 10;
	end
	
	-- Calculating and applying Weapon Bash damage
	local damage = math.floor(((darkKnightLvl + 11) / 4) + equipmentBonus);
	target:delHP(damage);
	target:updateEnmityFromDamage(player,damage);
end;
