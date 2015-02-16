-----------------------------------------
-- ID: 5851
-- Item: Bottle of Berserker's Tonic
-- Item Effect: Increases Dbl Attk 80%
-- Duration: 60 secs
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
	
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,60,5851)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DOUBLE_ATTACK, 80);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DOUBLE_ATTACK, 80);
end;
