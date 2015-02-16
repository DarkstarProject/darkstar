-----------------------------------------
-- ID: 5841
-- Item: Bottle of Ascetic's Tonic
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
	
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,60,5841)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_MACC, 10);
	target:addMod(MOD_MATT, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_MACC, 10);
	target:delMod(MOD_MATT, 10);
end;
