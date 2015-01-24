-----------------------------------------
-- ID: 14864
-- Item: Palmer's Bangles
-- Enchantment: Gilfinder
-- Duration: 30 Mins  Charges: 20
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if(target:addStatusEffect(EFFECT_ENCHANTMENT) == false) then
		target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,1800,14864);
	end;	
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_GILFINDER, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_GILFINDER, 1);
end;