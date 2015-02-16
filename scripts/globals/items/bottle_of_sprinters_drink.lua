-----------------------------------------
-- ID: 5397
-- Item: Bottle of Sprinter's Drink
-- Item Effect: Increases Movement Speed +100
-- Duration: 60 Secs
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,60,5397)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_MOVE,100);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_MOVE,100);
end;
