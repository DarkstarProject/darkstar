-----------------------------------------
-- ID: 17584
-- Item: Kingdom Signet Staff
-- Effect: Signet
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
	if(target:hasStatusEffect(EFFECT_SIGNET) == true) then
		target:delStatusEffect(EFFECT_SIGNET);
		target:addStatusEffect(EFFECT_SIGNET,1,3,21600);
	elseif(target:hasStatusEffect(EFFECT_SIGNET) == false) then
		target:addStatusEffect(EFFECT_SIGNET,1,3,21600);
		target:messageBasic(422);
	end
end;