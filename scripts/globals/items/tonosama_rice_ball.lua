-----------------------------------------
-- ID: 4277
-- Item: tonosama_rice_ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +15, Dex +3, Vit +3, Chr +3.  (Atk +50, Def +30, DA% +1) * number of enhancing gear
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
	target:addStatusEffect(EFFECT_FOOD,RiceBalls(target),0,1800,4277);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
	target:addMod(MOD_HP, 15);
   target:addMod(MOD_DEX, 3);
   target:addMod(MOD_VIT, 3);
   target:addMod(MOD_CHR, 3);
   target:addMod(MOD_ATT, 50*power);
   target:addMod(MOD_DEF, 30*power);
   target:addMod(MOD_DOUBLE_ATTACK,1*power);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   local power = effect:getPower();
	target:delMod(MOD_HP, 15);
   target:delMod(MOD_DEX, 3);
   target:delMod(MOD_VIT, 3);
   target:delMod(MOD_CHR, 3);
   target:delMod(MOD_ATT, 50*power);
   target:delMod(MOD_DEF, 30*power);
   target:delMod(MOD_DOUBLE_ATTACK,1*power);
end;
