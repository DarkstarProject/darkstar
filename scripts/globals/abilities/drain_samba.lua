require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
 
function OnAbilityCheck(player,target,ability)
	if (player:hasStatusEffect(EFFECT_TRANCE)) then
		return 0,0;
	elseif (player:getTP() < 10) then
		return MSGBASIC_NOT_ENOUGH_TP,0;
	else
		player:delTP(10);
		return 0,0;
	end;
end;

function OnUseAbility(player, target, ability)
	player:delStatusEffect(EFFECT_HASTE_SAMBA);
	player:delStatusEffect(EFFECT_ASPIR_SAMBA);
	player:addStatusEffect(EFFECT_DRAIN_SAMBA,1,0,120);
end;
-----------------------------------
-- onEffectGain Action
-----------------------------------
 function onEffectGain(target,effect)
	target:addMod(MOD_ENSPELL, 19);
	target:addMod(MOD_ENSPELL_DMG, 1);
 end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------
 
 function onEffectLose(target,effect)
	target:setMod(MOD_ENSPELL,0);
	target:setMod(MOD_ENSPELL_DMG,0);
 end;