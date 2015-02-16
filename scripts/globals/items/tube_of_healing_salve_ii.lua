-----------------------------------------
-- ID: 5836
-- Item: Tube of Healing Salve II
-- Item Effect: Restores 100% HP to Pet
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	mHP = target:getMaxHP();
	cHP = target:getHP();
	rHP = mHP - cHP;
	if (mHP == cHP) then
		result = 56; -- Does not let player use item if their pet's hp is full
	end
	if (target:getObjType() ~= TYPE_PET)
		result = 56;
	end
	if (target:hasStatusEffect(EFFECT_MEDICINE)) then
		result = 111;
	end	
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_MEDICINE,0,0,180);
	target:addHP(rHP)
	target:messageBasic(25,0,rHP);
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