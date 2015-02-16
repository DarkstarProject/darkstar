-----------------------------------------
-- ID: 5572
-- Item: Irmik Helvasi
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 70
-- MP +3% Cap 13
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
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,5572);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_HPP, 10);
	target:addMod(MOD_FOOD_HP_CAP, 70);
	target:addMod(MOD_FOOD_MPP, 3);
	target:addMod(MOD_FOOD_MP_CAP, 13);
	target:addMod(MOD_INT, 1);
	target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_HPP, 10);
	target:delMod(MOD_FOOD_HP_CAP, 70);
	target:delMod(MOD_FOOD_MPP, 3);
	target:delMod(MOD_FOOD_MP_CAP, 13);
	target:delMod(MOD_INT, 1);
	target:delMod(MOD_MPHEAL, 1);
end;
