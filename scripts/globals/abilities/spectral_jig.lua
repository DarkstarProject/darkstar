-----------------------------------
-- Ability: Spectral jig
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	
	local maxDuration = 90;
	local bonusItem = target:getEquipID(SLOT_FEET);
	
	if(bonusItem == 15746 or bonusItem == 15747 or bonusItem == 11393 or bonusItem == 11394) then -- Dancer's Shoes / Dancer's Shoes +1
		maxDuration = maxDuration * 2;
	end
	
	local randTime = math.random(30,maxDuration);
	
	if(player:hasStatusEffect(EFFECT_SNEAK) == false and player:hasStatusEffect(EFFECT_INVISIBLE) == false) then
		player:addStatusEffect(EFFECT_SNEAK,0,10,randTime);
		player:addStatusEffect(EFFECT_INVISIBLE,0,10,randTime);
	else
		ability:setMsg(75); -- no effect.
	end
	
	return 1;
end;