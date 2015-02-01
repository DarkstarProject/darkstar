-----------------------------------------
-- ID: 5246
-- Item: Vial of Drachenessence
-- Item Effect: Restores 25% HP to Wyvern
-- Pet
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	local mHP = target:getMaxHP();
	local cHP = target:getHP();
	if (mHP == cHP) then
		result = 56; -- Does not let player use item if their pet's hp is full
	end
	if (target:getObjType() ~= TYPE_PET)
		result = 56;
	end
	if (!target:getPetType() == PETTYPE_WYVERN) then
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
	local mHP = target:getMaxHP();
	local rHP = (mHP * .25) * PETFOOD_POWER;
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