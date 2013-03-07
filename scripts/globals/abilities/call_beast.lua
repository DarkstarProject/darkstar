-----------------------------------
-- Ability: Call Beast
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getPet() ~= nil) then
		return MSGBASIC_ALREADY_HAS_A_PET,0;
	elseif (not player:hasValidJugPetItem()) then
		return MSGBASIC_NO_JUG_PET_ITEM,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	player:spawnPet(player:getWeaponSubSkillType(SLOT_AMMO));
end;
