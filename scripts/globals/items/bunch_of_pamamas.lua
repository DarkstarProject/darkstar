-----------------------------------------
-- ID: 4468
-- Item: Bunch of Pamamas
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength -3
-- Intelligence 1
-- Additional Effect with Opo-Opo Crown
-- HP 50
-- MP 50
-- CHR 14
-- Additional Effect with Kinkobo or 
-- Primate Staff
-- DELAY -90
-- ACC 10
-- Additional Effect with Primate Staff +1
-- DELAY -80
-- ACC 12
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0
	if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,PamamasEquip(target),0,1800,4468);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	local power = effect:getPower();
	if (power == 1 or power == 4 or power == 5) then
		target:addMod(MOD_HP, 50);
		target:addMod(MOD_MP, 50);
		target:addMod(MOD_AGI, -3);
		target:addMod(MOD_CHR, 14);
	end
	if (power == 2 or power == 4) then
		target:addMod(MOD_DELAY, -90);
		target:addMod(MOD_ACC, 10);
	end
	if (power == 3 or power == 5) then
		target:addMod(MOD_DELAY, -80);
		target:addMod(MOD_ACC, 12);
	end
	target:addMod(MOD_STR, -3);
	target:addMod(MOD_INT, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	local power = effect:getPower();
	if (power == 1 or power == 4 or power == 5) then
		target:delMod(MOD_HP, 50);
		target:delMod(MOD_MP, 50);
		target:delMod(MOD_AGI, -3);
		target:delMod(MOD_CHR, 14);
	end
	if (power == 2 or power == 4) then
		target:delMod(MOD_DELAY, -90);
		target:delMod(MOD_ACC, 10);
	end
	if (power == 3 or power == 5) then
		target:delMod(MOD_DELAY, -80);
		target:delMod(MOD_ACC, 12);
	end
	target:delMod(MOD_STR, -3);
	target:delMod(MOD_INT, 1);
end;
