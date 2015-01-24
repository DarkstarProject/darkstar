-----------------------------------------
-- ID: 15460
-- Item: Deductive Gold Obi
-- Enchantment: MND +3
-- Durration: 60 Secs
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

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
	if(target:hasStatusEffect(EFFECT_ENCHANTMENT) == false) then
		target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,60,15460);
	end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_MND, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_MND, 3);
end;