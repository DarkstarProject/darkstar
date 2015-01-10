-----------------------------------
-- Ability: Assault
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (player:getPet() == nil) then
		return MSGBASIC_REQUIRES_A_PET,0;
	else
		if (target:getID() == player:getPet():getID() or (target:getMaster() ~= nil and target:getMaster():isPC())) then
			return MSGBASIC_CANNOT_ATTACK_TARGET,0;
		else
			return 0,0;
		end
	end
end;

function onUseAbility(player, target, ability)
	local pet = player:getPet();

	if(player:checkDistance(pet) <= 25) then
		player:petAttack(target);
	end
end;
