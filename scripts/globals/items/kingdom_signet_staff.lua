-----------------------------------------
-- ID: 17583
-- Item: Kingdom Signet Staff
-- Item Effect: Grants target Signet
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	if (target:getNation() ~= 0) then
		result = 56;
	end
	if (target:checkSoloPartyAlliance() == 0) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:delStatusEffect(EFFECT_SIGNET);
	target:addStatusEffect(EFFECT_SIGNET,0,0,18000,0,0);
end;


