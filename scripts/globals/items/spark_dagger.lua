-----------------------------------------
-- ID: 17984
-- Item: Spark Dagger
-- Additional Effect: lightning Damage
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
	
	if (player:getEquipID(SLOT_AMMO) == 18228) and (player:getEquipID(SLOT_MAIN) == 17984) then -- BATTERY LVL 10
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_LIGHTNING, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHTNING,0);
		dmg = adjustForTarget(target,dmg,ELE_LIGHTNING);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHTNING,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
	return SUBEFFECT_LIGHTNING_DAMAGE,message,dmg;	
	end
		
	if (player:getEquipID(SLOT_AMMO) == 18229) and (player:getEquipID(SLOT_MAIN) == 17984) then -- KILO BATTERY LVL 30
		dmg = (dmg + 6)		
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_LIGHTNING, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHTNING,0);
		dmg = adjustForTarget(target,dmg,ELE_LIGHTNING);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHTNING,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
	return SUBEFFECT_LIGHTNING_DAMAGE,message,dmg;	
	end
	
	if (player:getEquipID(SLOT_AMMO) == 18230) and (player:getEquipID(SLOT_MAIN) == 17984) then	-- MEGA BATTERY LVL 50
		dmg = (dmg + 12)		
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_LIGHTNING, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHTNING,0);
		dmg = adjustForTarget(target,dmg,ELE_LIGHTNING);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHTNING,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
	return SUBEFFECT_LIGHTNING_DAMAGE,message,dmg;	
	end
end;


