-----------------------------------------
-- ID: 5617
-- Item: Lebkuchen Manse
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- MP 10% Cap 55
-- Intelligence 4
-- HP Recovered while healing 3
-- MP Recovered while healing 2
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
	target:addStatusEffect(EFFECT_FOOD,0,0,14400,5617);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_MPP, 10);
	target:addMod(MOD_FOOD_MP_CAP, 55);
	target:addMod(MOD_INT, 4);
	target:addMod(MOD_HPHEAL, 3);
	target:addMod(MOD_MPHEAL, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_MPP, 10);
	target:delMod(MOD_FOOD_MP_CAP, 55);
	target:delMod(MOD_INT, 4);
	target:delMod(MOD_HPHEAL, 3);
	target:delMod(MOD_MPHEAL, 2);
end;
