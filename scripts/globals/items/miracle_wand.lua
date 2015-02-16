-----------------------------------------
-- ID: 18844
-- Item: Miracle Wand
-- Item Effect: Party Member gets Regen
-- Durration: 120 Secs
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	if (!target:getSoloPartyAlliance() ~= 1)
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if(target:hasStatusEffect(EFFECT_REGEN) == false) then
		target:addStatusEffect(EFFECT_REGEN,12,3,120);
	else
		target:messageBasic(423);
	end
end;
