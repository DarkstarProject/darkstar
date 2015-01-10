-----------------------------------
-- Ability: Focus			 	 		 
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	local sLegs = player:getEquipID(SLOT_LEGS);
	local power = 20
	if(sLegs == 12512 or sLegs == 15226) then
		power = power + 10;
	end
   player:addStatusEffect(EFFECT_FOCUS,power,0,120);
end;