-----------------------------------------
--	ID: 19181
--	Item: Moogles Largesse
--	When used, you will obtain random 100 - 10,000 Gil.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addGil(math.random(100,10000));
end;