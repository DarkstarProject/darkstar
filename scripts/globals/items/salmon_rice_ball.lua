-----------------------------------------
-- ID: 4590
-- Item: salmon_rice_ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +25, Dex +2, Vit +2, Mnd -1, hHP +1 (Atk +40, Def +40)*enhances rice ball effect
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
	target:addStatusEffect(EFFECT_FOOD,RiceBalls(target),0,1800,4590);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
	target:addMod(MOD_HP, 25);
   target:addMod(MOD_DEX, 2);
   target:addMod(MOD_VIT, 2);
   target:addMod(MOD_MND, -1);
   target:addMod(MOD_HPHEAL, 1);
   target:addMod(MOD_ATT, 40*power);
   target:addMod(MOD_DEF, 40*power);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   local power = effect:getPower();
	target:delMod(MOD_HP, 25);
   target:delMod(MOD_DEX, 2);
   target:delMod(MOD_VIT, 2);
   target:delMod(MOD_MND, -1);
   target:delMod(MOD_HPHEAL, 1);
   target:delMod(MOD_ATT, 40*power);
   target:delMod(MOD_DEF, 40*power);
end;
