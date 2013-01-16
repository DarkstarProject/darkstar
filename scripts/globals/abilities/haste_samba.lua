require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
 
function OnUseAbility(player, target, ability)
	player:delStatusEffect(EFFECT_DRAIN_SAMBA);
	player:delStatusEffect(EFFECT_ASPIR_SAMBA);
	player:addStatusEffect(EFFECT_HASTE_SAMBA,1,0,120);
end; 
 
 
 
 function onEffectGain(player,target,effect)
	target:addMod(MOD_ENSPELL, 21);
	target:addMod(MOD_ENSPELL_DMG, 1);
 end;
 
 -----------------------------------
 
 
function onEffectTick(player,target,effect)
end;

 -----------------------------------
 
 function onEffectLose(player,target,effect)
	target:setMod(MOD_ENSPELL,0);
	target:setMod(MOD_ENSPELL_DMG,0);
 end;