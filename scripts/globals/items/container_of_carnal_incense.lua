-----------------------------------------
-- ID: 5243
-- Item: Container of Carnal Incense
-- Item Effect: Temp nullifies all physical dmg
-- Duration: 20 secs
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
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,20,5243)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_UDMGPHYS,-100);
	target:addMod(MOD_UDMGBREATH,-100);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_UDMGPHYS,-100);
	target:delMod(MOD_UDMGBREATH,-100);
end;