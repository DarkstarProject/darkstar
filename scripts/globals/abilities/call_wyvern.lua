-----------------------------------
-- Ability: Call Wyvern
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getPet() ~= nil) then
 		return MSGBASIC_ALREADY_HAS_A_PET,0;
	elseif(player:hasStatusEffect(EFFECT_SPIRIT_SURGE) == true) then
		return MSGBASIC_UNABLE_TO_USE_JA,0;
 	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	player:spawnPet(PET_WYVERN);
end;
