-----------------------------------
-- Ability: Haste Samba
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------
 
function OnAbilityCheck(player,target,ability)
	if (player:getTP() < 35) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	else
		player:delTP(35);
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)

	player:delStatusEffect(EFFECT_DRAIN_SAMBA);
	player:delStatusEffect(EFFECT_ASPIR_SAMBA);
	player:addStatusEffect(EFFECT_HASTE_SAMBA,1,0,120);
end;