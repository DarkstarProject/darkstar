-----------------------------------------
-- ID: 14671
-- Item: allied ring
-- Experience point bonus
-----------------------------------------
-- Bonus: +150%
-- Duration: 720 min
-- Max bonus: 9000 exp
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
	target:addStatusEffect(EFFECT_DEDICATION,150,0,43200);
	target:addMod(MOD_DEDICATION_CAP, 9000);
end;