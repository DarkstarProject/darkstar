-----------------------------------------
-- ID: 4545
-- Item: Bunch of Gysahl Greens
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility 3
-- Vitality -5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,300,4545);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_AGI, 3);
	target:addMod(MOD_VIT, -5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_AGI, 3);
	target:delMod(MOD_VIT, -5);
end;
