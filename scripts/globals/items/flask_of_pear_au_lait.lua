-----------------------------------------
-- ID: 4301
-- Item: Pear au Lait
-- Item Effect: Restores 300 HP over 300 seconds
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
	if (target:hasStatusEffect(EFFECT_REGEN) == false) then
		target:addStatusEffect(EFFECT_REGEN,3,3,300);
	else
		target:messageBasic(423);
	end
end;

