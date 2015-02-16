-----------------------------------------
-- ID: 5843
-- Item: Bottle of Champion's Tonic
-- Item Effect: Temporarily increases potency and haste
-- Duration: 60
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
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,60,5843)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HASTE_MAGIC, 154);
	target:addMod(MOD_CRITHITRATE, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HASTE_MAGIC, 154);
	target:delMod(MOD_CRITHITRATE, 30);
end;
