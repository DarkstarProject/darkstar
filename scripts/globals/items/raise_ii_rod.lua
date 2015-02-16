-----------------------------------------
-- ID: 17469
-- Item: Raise II Rod
-- Item Effect: Casts Raise II on target
-- Charges: 20
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	if (!target:hasStatusEffect(EFFECT_KO)) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:sendRaise(2);
	target:messageBasic(309);
end;
