-----------------------------------------
-- ID: 4486
-- Item: Dragon Heart
-- Food Effect: 3 Hr, Galka Only
-----------------------------------------
-- Strength 7
-- Intelligence -9
-- MP -40
-- HP 40
-- Dragon Killer 10
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0
	if (target:getRace() ~= 8) then
		result = 247;
	end
	if (target:getMod(MOD_EAT_RAW_MEAT) == 1) then
		result = 0;
	end
	if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
		result = 246;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,4486);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 7);
	target:addMod(MOD_INT, -9);
	target:addMod(MOD_MP, -40);
	target:addMod(MOD_HP, 40);
	target:addMod(MOD_DRAGON_KILLER, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 7);
	target:delMod(MOD_INT, -9);
	target:delMod(MOD_MP, -40);
	target:delMod(MOD_HP, 40);
	target:delMod(MOD_DRAGON_KILLER, 10);
end;
