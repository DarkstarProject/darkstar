-----------------------------------------
-- ID: 5929
-- Item: Ojo Rice Ball
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- HP 50
-- Dexterity 5
-- Vitality 5
-- Character 5
-- Effect with enhancing equipment
-- Attack +60
-- Defense +40
-- Triple Attack 2
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
	target:addStatusEffect(EFFECT_FOOD,RiceBalls(target),0,3600,5929);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   local power = effect:getPower();
	target:addMod(MOD_HP, 50);
   target:addMod(MOD_DEX, 5);
   target:addMod(MOD_VIT, 5);
   target:addMod(MOD_CHR, 5);
   target:addMod(MOD_ATT, 60*power);
   target:addMod(MOD_DEF, 40*power);
   target:addMod(MOD_TRIPLE_ATTACK,2*power);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
   local power = effect:getPower();
	target:delMod(MOD_HP, 50);
   target:delMod(MOD_DEX, 5);
   target:delMod(MOD_VIT, 5);
   target:delMod(MOD_CHR, 5);
   target:delMod(MOD_ATT, 60*power);
   target:delMod(MOD_DEF, 40*power);
   target:delMod(MOD_TRIPLE_ATTACK,2*power);
end;
