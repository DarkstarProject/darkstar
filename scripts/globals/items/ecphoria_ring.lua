-----------------------------------------
-- ID: 15817
-- Item: Ecphoria Ring
-- Item Effect: Remedies amnesia.
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

	if(target:hasStatusEffect(EFFECT_AMNESIA) == true) then
		target:delStatusEffect(EFFECT_AMNESIA);
	else
        	target:messageBasic(423); -- no effect
        end
end;

