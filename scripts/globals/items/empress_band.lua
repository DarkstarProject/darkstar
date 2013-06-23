-----------------------------------------
-- ID: 15762
-- Item: empress band
-- Experience point bonus
-----------------------------------------
-- Bonus: +50%
-- Duration: 180 min
-- Max bonus: 1000 exp
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
	target:addStatusEffect(EFFECT_DEDICATION,50,0,10800);
	target:addMod(MOD_DEDICATION_CAP, 1000);
end;