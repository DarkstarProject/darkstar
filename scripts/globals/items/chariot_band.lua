-----------------------------------------
-- ID: 15761
-- Item: Chariot Band
-- Experience point bonus
-----------------------------------------
-- Bonus: +75%
-- Duration: 90 min
-- Max bonus: 500 exp
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:hasStatusEffect(EFFECT_DEDICATION) == true) then
		result = 56;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_DEDICATION,75,0,5400);
	target:addMod(MOD_DEDICATION_CAP, 500);
end;