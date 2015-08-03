-----------------------------------------
-- ID: 18581
-- Item: Carbuncle's Pole
-- Item Effect: Restores 160-220 HP
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)

	local chance = math.random(1,2)
	
	if (chance > 1) then
	
		local dmg = math.random(50,90);
		local params = {};
		params.bonusmab = 0;
		params.includemab = false;
		dmg = addBonusesAbility(player, ELE_LIGHT, target, dmg, params);
		dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHT,0);
		dmg = adjustForTarget(target,dmg,ELE_LIGHT);
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,dmg);
    
		local message = 163;
		if (dmg < 0) then
			message = 167;
		end
    
		return SUBEFFECT_LIGHT_DAMAGE,message,dmg;
		
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

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local hpHeal = math.random(160,220);

	local dif = target:getMaxHP() - target:getHP();
	if (hpHeal > dif) then
		hpHeal = dif;
	end
	target:addHP(hpHeal);
	target:messageBasic(263,0,hpHeal);
end;