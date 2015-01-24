-----------------------------------------
--	ID: 17032
--	Gobbie Gavel
--	Enchantment: 60Min, Costume - Random Goblin
-----------------------------------------

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
	target:addStatusEffect(EFFECT_COSTUME,(math.random(484,511)),0,3600);	
end;