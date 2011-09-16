-----------------------------------------
-- ID: 4488
-- Item: jack-o-lantern
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Charisma -10
-- Accuracy 10
-- Evasion 10
-- Dark Def 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,0,4488);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_CHR, -10);
	target:addMod(MOD_ACC, 10);
	target:addMod(MOD_EVA, 10);
	target:addMod(MOD_DARKDEF, 25);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_CHR, -10);
	target:delMod(MOD_ACC, 10);
	target:delMod(MOD_EVA, 10);
	target:delMod(MOD_DARKDEF, 25);
end;
