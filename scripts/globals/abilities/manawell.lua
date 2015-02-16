-----------------------------------
-- Ability: Manawell
-- Negates the cost of the next
-- magic spell the target casts.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)

	if(player:hasStatusEffect(EFFECT_SPONTANEITY) == true) then
		return MSGBASIC_UNABLE_TO_USE_JA,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)

	player:addStatusEffect(EFFECT_MANAWELL,1,0,60);
end;
