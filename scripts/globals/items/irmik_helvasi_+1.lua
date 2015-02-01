-----------------------------------------
-- ID: 5573
-- Item: Irmik Helvasi +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 80
-- MP +3% Cap 15
-- Intelligence +1
-- MP Recovered while healing +7
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,14400,5573);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_HPP, 10);
	target:addMod(MOD_FOOD_HP_CAP, 80);
	target:addMod(MOD_FOOD_MPP, 3);
	target:addMod(MOD_FOOD_MP_CAP, 15);
	target:addMod(MOD_INT, 1);
	target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_HPP, 10);
	target:delMod(MOD_FOOD_HP_CAP, 80);
	target:delMod(MOD_FOOD_MPP, 3);
	target:delMod(MOD_FOOD_MP_CAP, 15);
	target:delMod(MOD_INT, 1);
	target:delMod(MOD_MPHEAL, 1);
end;
