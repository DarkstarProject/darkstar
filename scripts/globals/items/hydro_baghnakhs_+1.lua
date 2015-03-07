-----------------------------------------
-- ID: 17513
-- Item: Hydro Baghnakhs +1
-- Additional Effect: water Damage
-----------------------------------------

package.loaded["scripts/globals/magic"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
	local dmg = math.random(3,10);
	local params = {};

	if(player:getEquipID(SLOT_AMMO) == false) then
	 return 0,0,0;
	end
	
	if (player:getEquipID(SLOT_AMMO) == 18232) and (player:getEquipID(SLOT_MAIN) == 17513) then
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_WATER, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_WATER,0);
		dmg = adjustForTarget(target,dmg,ELE_WATER);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_WATER,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
	return SUBEFFECT_WATER_DAMAGE,message,dmg;	
	end
		
	if (player:getEquipID(SLOT_AMMO) == 18234) and (player:getEquipID(SLOT_MAIN) == 17513) then -- mega fan
		dmg = (dmg + 6)		
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_WATER, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_WATER,0);
		dmg = adjustForTarget(target,dmg,ELE_WATER);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_WATER,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
	return SUBEFFECT_WATER_DAMAGE,message,dmg;	
	end
	
	if (player:getEquipID(SLOT_AMMO) == 18233) and (player:getEquipID(SLOT_MAIN) == 17513) then	-- kilo fan
		dmg = (dmg + 12)		
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_WATER, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_WATER,0);
		dmg = adjustForTarget(target,dmg,ELE_WATER);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_WATER,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
	return SUBEFFECT_WATER_DAMAGE,message,dmg;	
	end
	
end;


