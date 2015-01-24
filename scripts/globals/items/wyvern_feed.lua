-----------------------------------------
-- ID: 18242
-- Item: Wyvern Feed
-- Item Effect: Pet gets regen
-- Durration: 60 Secs
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	if (target:getObjType() ~= TYPE_PET)
		result = 56;
	end
	if (!target:getPetType() == PETTYPE_WYVERN) then
		result = 56;
	end		
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if(target:hasStatusEffect(EFFECT_REGEN) == false) then
		target:addStatusEffect(EFFECT_REGEN,12,3,60);
	else
		target:messageBasic(423);
	end
end;
