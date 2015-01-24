-----------------------------------------
-- ID: 5543
-- Item: Midwinter Dream
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP 10
-- MP 9% Cap 60
-- Intelligence 2
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
	target:addStatusEffect(EFFECT_FOOD,0,0,14400,5543);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 10);
	target:addMod(MOD_INT, 2);
	target:addMod(MOD_FOOD_MPP, 9);
	target:addMod(MOD_FOOD_MP_CAP, 60);
	target:addMod(MOD_MPHEAL, 2);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 10);
	target:delMod(MOD_INT, 2);
	target:delMod(MOD_FOOD_MPP, 9);
	target:delMod(MOD_FOOD_MP_CAP, 60);
	target:delMod(MOD_MPHEAL, 2);
end;
