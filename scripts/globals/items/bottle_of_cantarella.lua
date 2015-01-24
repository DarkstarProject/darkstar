-----------------------------------------
-- ID: 4246
-- Item: Bottle of Cantarella
-- Item Effect: Poison 10HP / 3Tic
-- Duration: 10 Mins
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:hasStatusEffect(EFFECT_MEDICINE)) then
		result = 111;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	
	if(target:hasStatusEffect(EFFECT_POISON) == false) then
		target:addStatusEffect(EFFECT_POISON,10,3,600);
	else
		target:messageBasic(423);
	end
end;
