-----------------------------------------
-- ID: 5390
-- Item: Bottle of Braver's Drink
-- Item Effect: +15 All Attribs
-- Durration: 180 Secs
-----------------------------------------

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

	if(target:addStatusEffect(EFFECT_MEDICINE,0,0,180,5390)) then
		target:messageBasic(205);
	else
        	target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_STR, 15);
	target:addMod(MOD_DEX, 15);
	target:addMod(MOD_AGI, 15);
	target:addMod(MOD_VIT, 15);
	target:addMod(MOD_INT, 15);
	target:addMod(MOD_MND, 15);
	target:addMod(MOD_CHR, 15);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_STR, 15);
	target:delMod(MOD_DEX, 15);
	target:delMod(MOD_AGI, 15);
	target:delMod(MOD_VIT, 15);
	target:delMod(MOD_INT, 15);
	target:delMod(MOD_MND, 15);
	target:delMod(MOD_CHR, 15);
end;
