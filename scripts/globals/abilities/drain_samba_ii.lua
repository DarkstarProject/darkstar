require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
 
function OnAbilityCheck(player,target,ability)
	if (player:getTP() < 25) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	else
		player:delTP(25);
		return 0,0;
	end
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