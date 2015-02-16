-----------------------------------
-- Ability: Nether Void
-- Increases the absorption of your
-- next dark magic spell.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local power = 50;
	local legs = target:getEquipID(SLOT_LEGS);
	
	if (legs == 11231) then -- Bale Flanchard +1
		power = power + 15;
	elseif (legs == 11131) then -- Bale Flanchard +2
		power = power + 25;
	end
	
	player:addStatusEffect(EFFECT_NETHER_VOID,power,0,60);
end;
