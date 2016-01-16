-----------------------------------------
-- ID: 5746
-- Item: serving_of_cherry_bavarois_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP 30
-- Intelligence 4
-- MP 15
-- HP Recovered While Healing 4
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5746);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_HPHEAL, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_HPHEAL, 4);
end;
