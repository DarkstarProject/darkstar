-----------------------------------------
-- ID: 5842
-- Item: Bottle of Ascetic's Gambir
-- Item Effect: Temporarily increases magic atk power and acc
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
	
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,60,5842)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_MACC, 30);
	target:addMod(MOD_MATT, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_MACC, 30);
	target:delMod(MOD_MATT, 30);
end;
