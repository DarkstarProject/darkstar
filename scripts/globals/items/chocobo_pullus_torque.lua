-----------------------------------------
--	ID: 16273
--	Pullus Torque
--	Enchantment: 60Min, Costume - chicobo
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canUseCostume();
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_COSTUME,1997,0,3600);
end;