-----------------------------------------
-- ID: 17711
-- Item: Shiva's Shotel
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)

	local chance = 1;
	
	if (player:getMLevel() - target:getMLevel() > 5) then
		chance = math.random(1,2);
	else
		chance = 2;
	end
	
	
	if (chance > 1) then
	
		local dmg = math.random(38,70);
		local params = {};
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_ICE, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_ICE,0);
		dmg = adjustForTarget(target,dmg);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_ICE,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
    
		return SUBEFFECT_ICE_DAMAGE,message,dmg;
		
		else
			return 0,0,0;
	end
end;

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;