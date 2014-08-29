-----------------------------------------
-- ID: 5928
-- Item: Himesama Rice Ball
-- Food Effect: 30 Mins, All Races
-----------------------------------------
-- HP 25
-- Dexterity 4
-- Vitality 4
-- Character 4
-- Effect with enhancing equipment
-- Attack +60
-- Defense +40
-- Triple Attack 1
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
	target:addStatusEffect(EFFECT_FOOD,RiceBalls(target),0,1800,5928);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
	target:addMod(MOD_HP, 25);
   target:addMod(MOD_DEX, 4);
   target:addMod(MOD_VIT, 4);
   target:addMod(MOD_CHR, 4);
   target:addMod(MOD_ATT, 60*power);
   target:addMod(MOD_DEF, 40*power);
   target:addMod(MOD_TRIPLE_ATTACK,1*power);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   local power = effect:getPower();
	target:delMod(MOD_HP, 25);
   target:delMod(MOD_DEX, 4);
   target:delMod(MOD_VIT, 4);
   target:delMod(MOD_CHR, 4);
   target:delMod(MOD_ATT, 60*power);
   target:delMod(MOD_DEF, 40*power);
   target:delMod(MOD_TRIPLE_ATTACK,1*power);
end;
