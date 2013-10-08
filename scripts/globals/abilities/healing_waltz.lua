-----------------------------------
-- Ability: Divine Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:hasStatusEffect(EFFECT_TRANCE)) then
		return 0,0;
	elseif (player:getTP() < 20) then
		return MSGBASIC_NOT_ENOUGH_TP,0;
	else
		player:delTP(20);
		return 0,0;
	end;
end;

function OnUseAbility(player, target, ability)
	target:healingWaltz();	
end;
