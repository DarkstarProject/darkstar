-----------------------------------------
-- ID: 18117
-- Item: Gimlet Spear
-- Enchantment: Attack +3
-- Duration: 30 Mins
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if (target:hasStatusEffect(EFFECT_ENCHANTMENT) == false) then
		target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,1800,18117);
	end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_ATT, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_ATT, 3);
end;