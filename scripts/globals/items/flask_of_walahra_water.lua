-----------------------------------------
-- ID: 5354
-- Item: Flask of Walahra Water
-- Item Effect: HP +5% MP +5%
-- Durration: Medicated 3 Mins
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
	mHP = target:getMaxHP();
	cHP = target:getHP();
	mMP = target:getMaxMP();
	cMP = target:getMP();

	if (mHP == cHP and mMP == cMP) then
		result = 56; -- Does not let player use item if their hp and mp are full
	end

	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)

	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,180,5354)) then
		target:messageBasic(205);
		target:addHP((target:getMaxHP()/100)*5);
		target:addMP((target:getMaxMP()/100)*5);
		target:messageBasic(26);
		
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
end;
