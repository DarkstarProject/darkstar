-----------------------------------
-- Ability: Angon
-- Expend an Angon to lower enemy
-- defense.
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (player:getEquipID(SLOT_AMMO) ~= 18259) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
end;
