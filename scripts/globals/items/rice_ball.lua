-----------------------------------------
-- ID: 4405
-- Item: rice_ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP 10, Vit +2, Dex -1, hHP +1 (Def +50)*enhances rice ball effect
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/equipment");

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
	target:addStatusEffect(EFFECT_FOOD,RiceBalls(target),0,1800,4405);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
	target:addMod(MOD_HP, 10);
   target:addMod(MOD_VIT, 2);
   target:addMod(MOD_DEX, -1);
   target:addMod(MOD_DEF, 40*power);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   local power = effect:getPower();
	target:delMod(MOD_HP, 10);
   target:delMod(MOD_VIT, 2);
   target:delMod(MOD_DEX, -1);
   target:delMod(MOD_DEF, 40*power);
end;
