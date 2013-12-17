-----------------------------------
-- Ability: Haste Samba
-----------------------------------
 
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------
 
function OnAbilityCheck(player,target,ability)
if (player:hasStatusEffect(EFFECT_TRANCE)) then
	return 0,0;
	elseif (player:getTP() < 35) then
		return MSGBASIC_NOT_ENOUGH_TP,0;
	else
		player:delTP(35);
		return 0,0;
	end;
end;

function OnUseAbility(player, target, ability)

	player:delStatusEffect(EFFECT_DRAIN_SAMBA);
	player:delStatusEffect(EFFECT_ASPIR_SAMBA);
	player:addStatusEffect(EFFECT_HASTE_SAMBA,player:getMerit(MERIT_HASTE_SAMBA_EFFECT)+52,0,120);
end;