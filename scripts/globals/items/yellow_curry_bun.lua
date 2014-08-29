-----------------------------------------
-- ID: 5757
-- Item: yellow_curry_bun
-- Food Effect: 30minutes, All Races
-----------------------------------------
-- Health Points 25
-- Strength 5
-- Agility 2
-- Intelligence -4 
-- Attack 20% (caps @ 75)
-- Ranged Attack 20% (caps @ 75)
-- Resist Sleep
-- Resist Stun


--Alternate Food Effects: (30 minutes, Party size = 4)
--Same as above, with the following changes:
    --Attack +20% (Cap: 85)
    --Ranged Attack +20% (Cap: 85)
--**no clue how to script this, but the basic effect f the food will work	
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,5757);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_HP, 25);
	target:addMod(MOD_STR, 5);
	target:addMod(MOD_AGI, 2);
	target:addMod(MOD_INT, -4);
	target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 75);
    target:addMod(MOD_FOOD_RATTP, 20);
    target:addMod(MOD_FOOD_RATT_CAP, 75);
	target:addMod(MOD_SLEEPRES, 5);
	target:addMod(MOD_STUNRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_HP, 25);
	target:delMod(MOD_STR, 5);
	target:delMod(MOD_AGI, 2);
	target:delMod(MOD_INT, -4);
	target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 75);
    target:delMod(MOD_FOOD_RATTP, 20);
    target:delMod(MOD_FOOD_RATT_CAP, 75);
	target:delMod(MOD_SLEEPRES, 5);
	target:delMod(MOD_STUNRES, 5);
end;
