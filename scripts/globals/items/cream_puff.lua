-----------------------------------------
-- ID: 5718
-- Item: Cream Puff
-- Food Effect: 30 minutes, All Races
-----------------------------------------
-- Intelligence +7
-- HP -10
-- Resist Slow
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
	target:addStatusEffect(EFFECT_FOOD,0,0,3600,5718);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FASTCAST, 15);
	target:addMod(MOD_INT, 20);
	target:addMod(MOD_MND, 20);
	target:addMod(MOD_HPP, 10);
	target:addMod(MOD_MPP, 25);
	target:addMod(MOD_MATT, 15);
	target:addMod(MOD_MACC, 15);
	target:addMod(MOD_MPHEAL, 15);
	target:addMod(MOD_ENMITY, -20);
	target:addMod(MOD_SLOWRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FASTCAST, 15);
	target:delMod(MOD_INT, 20);
	target:delMod(MOD_MND, 20);
	target:delMod(MOD_HPP, 10);
	target:delMod(MOD_MPP, 25);
	target:delMod(MOD_MATT, 15);
	target:delMod(MOD_MACC, 15);
	target:delMod(MOD_MPHEAL, 15);
	target:delMod(MOD_ENMITY, -20);
	target:delMod(MOD_SLOWRES, 5);
end;