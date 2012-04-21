-----------------------------------------
-- ID: 5328
-- Item: Hi-Potion Drop 
-- Item Effect: Restores 110 HP
-----------------------------------------

require("scripts/globals/settings");

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
	target:addHP(110);
	target:addStatusEffect(EFFECT_MEDICINE,300);
end;