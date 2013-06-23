-----------------------------------------
-- ID: 15763
-- Item: emperor band
-- Experience point bonus
-----------------------------------------
-- Bonus: +50%
-- Duration: 210 min
-- Max bonus: 2000 exp
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
	target:addStatusEffect(EFFECT_DEDICATION,50,0,18900);
	target:addMod(MOD_DEDICATION_CAP, 2000);
end;