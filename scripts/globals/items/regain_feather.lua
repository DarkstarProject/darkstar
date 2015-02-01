-----------------------------------------
--  ID: 5260
--  Item: Regain Feather
--  Effect: Restore 100% HP 100% MP 300% TP
--  Duration: Instant 2 Hrs Medicated
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	mHP = target:getMaxHP();
	cHP = target:getHP();
	mMP = target:getMaxMP();
	cMP = target:getMP();
	result = 0;
	if (target:hasStatusEffect(EFFECT_MEDICINE)) then
		result = 111;
	end
	if (mHP == cHP and mMP == cMP) then
		result = 56; -- Does not let player use item if their hp and mp are full
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_MEDICINE,0,0,7200,5260);
	target:setHP(mHP);
	target:setMP(mMP);
	target:setTP(300);
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