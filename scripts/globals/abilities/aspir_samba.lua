require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
 
function OnAbilityCheck(player,target,ability)
    if(player:hasStatusEffect(EFFECT_FAN_DANCE)) then
        return MSGBASIC_UNABLE_TO_USE_JA2, 0;
    elseif (player:hasStatusEffect(EFFECT_TRANCE)) then
		return 0,0;
	elseif (player:getTP() < 10) then
		return MSGBASIC_NOT_ENOUGH_TP,0;
	else
		player:delTP(10);
		return 0,0;
	end;
end;

function OnUseAbility(player, target, ability)
    local duration = 120 + player:getMod(MOD_SAMBA_DURATION);
    duration = duration * (100 + player:getMod(MOD_SAMBA_PDURATION))/100;
	player:delStatusEffect(EFFECT_HASTE_SAMBA);
	player:delStatusEffect(EFFECT_DRAIN_SAMBA);
	player:addStatusEffect(EFFECT_ASPIR_SAMBA,1,0,duration);
end;
