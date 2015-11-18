-----------------------------------------
-- ID: 4163
-- Item: Blinding Potion
-- Item Effect: This potion induces blindness.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if (target:hasStatusEffect(EFFECT_BLINDNESS) == false) then
		target:addStatusEffect(EFFECT_BLINDNESS,25,0,180);
	else
		target:messageBasic(423);
	end
end;

