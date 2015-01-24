-----------------------------------------
--  ID: 15912
--  Item: Lieutenant's Sash
--  Enchantment: Remove Food Effects
--  Max Charges: 100      Use Delay: 12 secs
--  Casting Time: 15 secs  Reuse Delay: 30 mins
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0
	if (target:hasStatusEffect(EFFECT_FOOD) ~= true) then
		result = 246;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if(target:hasStatusEffect(EFFECT_FOOD) == true) then
		target:delStatusEffect(EFFECT_FOOD);
	end
end;
