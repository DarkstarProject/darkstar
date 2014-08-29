-----------------------------------------
-- ID: 5174
-- Item: tavnazian_taco
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 20
-- Magic 20
-- Dexterity 4
-- Agility 4
-- Vitality 6
-- Charisma 4
-- Defense % 25
-- HP Recovered While Healing 1
-- MP Recovered While Healing 1
-- Defense Cap 150
-----------------------------------------

require("scripts/globals/status");

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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,5174);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 20);
	target:addMod(MOD_MP, 20);
	target:addMod(MOD_DEX, 4);
	target:addMod(MOD_AGI, 4);
	target:addMod(MOD_VIT, 6);
	target:addMod(MOD_CHR, 4);
	target:addMod(MOD_FOOD_DEFP, 25);
	target:addMod(MOD_FOOD_DEF_CAP, 150);
	target:addMod(MOD_HPHEAL, 1);
	target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 20);
	target:delMod(MOD_MP, 20);
	target:delMod(MOD_DEX, 4);
	target:delMod(MOD_AGI, 4);
	target:delMod(MOD_VIT, 6);
	target:delMod(MOD_CHR, 4);
	target:delMod(MOD_FOOD_DEFP, 25);
	target:delMod(MOD_FOOD_DEF_CAP, 150);
	target:delMod(MOD_HPHEAL, 1);
	target:delMod(MOD_MPHEAL, 1);
end;
