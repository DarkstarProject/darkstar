-----------------------------------------
--	ID: 17031
--	Shell Scepter
--	Enchantment: 60Min, Costume - Random Crab
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
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
	target:addStatusEffect(EFFECT_COSTUME,(math.random(356,357)),0,3600);
end;