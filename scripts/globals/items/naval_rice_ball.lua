-----------------------------------------
-- ID: 4605
-- Item: naval_rice_ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +26, Dex +3, Vit +4, hHP +2 (Atk +40, Def +40, Arcana Killer)*enhances rice ball effect
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
	target:addStatusEffect(EFFECT_FOOD,RiceBalls(target),0,1800,4605);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
	target:addMod(MOD_HP, 26);
   target:addMod(MOD_DEX, 3);
   target:addMod(MOD_VIT, 3);
   target:addMod(MOD_HPHEAL, 2);
   target:addMod(MOD_ATT, 40*power);
   target:addMod(MOD_DEF, 40*power);
   target:addMod(MOD_ARCANA_KILLER,5*power); -- TODO: This power is sort of made up.
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   local power = effect:getPower();
	target:delMod(MOD_HP, 26);
   target:delMod(MOD_DEX, 3);
   target:delMod(MOD_VIT, 3);
   target:delMod(MOD_HPHEAL, 2);
   target:delMod(MOD_ATT, 40*power);
   target:delMod(MOD_DEF, 40*power);
   target:delMod(MOD_ARCANA_KILLER,5*power);
end;
