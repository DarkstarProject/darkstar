-----------------------------------------
-- ID: 5853
-- Item: Flask of Primeval Brew
-- Item Effect: Makes you a God
-- Duration: 3 Mins
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	result = 0;
	if (target:hasStatusEffect(EFFECT_MEDICINE)) then
		result = 111;
	end	
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,180,5853)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_HPP, 500);
	target:addMod(MOD_FOOD_HP_CAP, 9999);
	target:addMod(MOD_FOOD_MPP, 500);
	target:addMod(MOD_FOOD_MP_CAP, 9999);
	target:addMod(MOD_STR, 999);
	target:addMod(MOD_DEX, 999);
	target:addMod(MOD_AGI, 999);
	target:addMod(MOD_VIT, 999);
	target:addMod(MOD_INT, 999);
	target:addMod(MOD_MND, 999);
	target:addMod(MOD_CHR, 999);
	target:addMod(MOD_FOOD_ATTP, 500);
	target:addMod(MOD_FOOD_ATT_CAP, 9999);
	target:addMod(MOD_FOOD_DEFP, 500);
	target:addMod(MOD_FOOD_DEF_CAP, 9999);
	target:addMod(MOD_REGEN, 300);
	target:addMod(MOD_REFRESH, 300);
	target:addMod(MOD_REGAIN, 50);
	target:addMod(MOD_DMG, -90);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_HPP, 500);
	target:delMod(MOD_FOOD_HP_CAP, 9999);
	target:delMod(MOD_FOOD_MPP, 500);
	target:delMod(MOD_FOOD_MP_CAP, 9999);
	target:delMod(MOD_STR, 999);
	target:delMod(MOD_DEX, 999);
	target:delMod(MOD_AGI, 999);
	target:delMod(MOD_VIT, 999);
	target:delMod(MOD_INT, 999);
	target:delMod(MOD_MND, 999);
	target:delMod(MOD_CHR, 999);
	target:delMod(MOD_FOOD_ATTP, 500);
	target:delMod(MOD_FOOD_ATT_CAP, 9999);
	target:delMod(MOD_FOOD_DEFP, 500);
	target:delMod(MOD_FOOD_DEF_CAP, 9999);
	target:delMod(MOD_REGEN, 300);
	target:delMod(MOD_REFRESH, 300);
	target:delMod(MOD_REGAIN, 50);
	target:delMod(MOD_DMG, -90);
end;
