-----------------------------------------
-- ID: 5680
-- Item: Agaricus Mushroom
-- Food Effect: 5 Mins, All Races
-----------------------------------------
-- HP Healing +5
-- MP Healing +5
-- Strength -3
-- Mind +4
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
	target:addStatusEffect(EFFECT_FOOD,0,0,300,5680);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HPHEAL, 5);
	target:addMod(MOD_MPHEAL, 5);
	target:addMod(MOD_STR, -3);
	target:addMod(MOD_MND, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HPHEAL, 5);
	target:delMod(MOD_MPHEAL, 5);
	target:delMod(MOD_STR, -3);
	target:delMod(MOD_MND, 4);
end;
