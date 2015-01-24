-----------------------------------
-- Ability: Mana Cede
-- Channels your MP into TP for
-- avatars and elementals.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	local pet = target:getPet();
	-- The avatar or elemental must be present in order to use Mana Cede
	if (pet == nil) then
		return MSGBASIC_REQUIRES_A_PET,0;
	else
		if (player:getMP() < 100) then
			return MSGBASIC_UNABLE_TO_USE_JA2,0;
		elseif (pet:getTP() == 300) then
			return MSGBASIC_UNABLE_TO_USE_JA2,0;
		else
			player:delMP(100);
			return 0,0;
		end
	end
end;

function OnUseAbility(player, target, ability)

	local tpBoost = 100;
	local equipBonus = player:getMod(MOD_MANA_CEDE);
	local pet = target:getPet();

	pet:addTP(tpBoost + equipBonus);

end;