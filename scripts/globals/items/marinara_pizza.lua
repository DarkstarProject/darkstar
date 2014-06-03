-----------------------------------------
-- ID: 5743
-- Item: marinara_pizza
-- Food Effect: 3hours, All Races
-----------------------------------------
-- Health Points 20
-- Attack +20% (cap 50 @ 250 base attack)
-- Accuracy +10% (cap 40+ @ 400+ base accuracy)  *Wiki doesnt know for sure, its uncorfirmed on how hight the accuracy caps at, so i just put at 40 for now
-- Undead Killer
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,5743);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 20);
	target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 50);
	target:addMod(MOD_FOOD_ACCP, 10);
    target:addMod(MOD_FOOD_ACC_CAP, 40);
	target:addMod(MOD_UNDEAD_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 20);
	target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 50);
	target:delMod(MOD_FOOD_ACCP, 10);
    target:delMod(MOD_FOOD_ACC_CAP, 40);
	target:delMod(MOD_UNDEAD_KILLER, 5);
end;
