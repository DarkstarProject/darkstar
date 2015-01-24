-----------------------------------------
-- ID: 5244
-- Item: Container of Spiritual Incense
-- Item Effect: Temp nullifies all magic dmg
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
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,20,5244)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_UDMGMAGIC,-256);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_UDMGMAGIC,-256);
end;