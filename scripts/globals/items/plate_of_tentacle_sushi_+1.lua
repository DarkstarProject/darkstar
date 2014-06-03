-----------------------------------------
-- ID: 5216
-- Item: plate_of_tentacle_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP 20
-- Dexterity 3
-- Agility 3
-- Mind -1
-- Accuracy % 19 (no cap on HQ)
-- Ranged Accuracy % 19 (no cap on HQ)
-- Double Attack 1
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
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5216);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 20);
	target:addMod(MOD_DEX, 3);
	target:addMod(MOD_AGI, 3);
	target:addMod(MOD_MND, -1);
	target:addMod(MOD_FOOD_ACCP, 19);
	target:addMod(MOD_FOOD_ACC_CAP, 999);
	target:addMod(MOD_FOOD_RACCP, 19);
	target:addMod(MOD_FOOD_RACC_CAP, 999);
	target:addMod(MOD_DOUBLE_ATTACK, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 20);
	target:delMod(MOD_DEX, 3);
	target:delMod(MOD_AGI, 3);
	target:delMod(MOD_MND, -1);
	target:delMod(MOD_FOOD_ACCP, 19);
	target:delMod(MOD_FOOD_ACC_CAP, 999);
	target:delMod(MOD_FOOD_RACCP, 19);
	target:delMod(MOD_FOOD_RACC_CAP, 999);
	target:delMod(MOD_DOUBLE_ATTACK, 1);
end;
