-----------------------------------------
-- ID: 14785
-- Item: Janizary Earring
-- Enchantment: DEF 32
-- Charges: 20	Reuse Delay: 30 Mins
-- Duration: 60 Secs
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
		target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,60,14785);
	end;	
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DEF, 32);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEF, 32);
end;