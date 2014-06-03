-----------------------------------------
-- ID: 4604
-- Item: rogue_rice_ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +12, Vit +3, hHP +2, (Def +50, Beast Killer)*enhances rice ball effect
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
	target:addStatusEffect(EFFECT_FOOD,RiceBalls(target),0,3600,4604);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
	target:addMod(MOD_HP, 12);
   target:addMod(MOD_VIT, 3);
   target:addMod(MOD_HPHEAL, 2);
   target:addMod(MOD_DEF, 50*power);
   target:addMod(MOD_BEAST_KILLER,5*power); -- TODO: This power is sort of made up.
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   local power = effect:getPower();
	target:delMod(MOD_HP, 12);
   target:delMod(MOD_VIT, 3);
   target:delMod(MOD_HPHEAL, 2);
   target:delMod(MOD_DEF, 50*power);
   target:delMod(MOD_BEAST_KILLER,5*power); -- TODO: This power is sort of made up.
end;
