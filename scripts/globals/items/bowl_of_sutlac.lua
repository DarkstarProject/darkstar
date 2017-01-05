-----------------------------------------
-- ID: 5577
-- Item: Bowl of Sutlac
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +8
-- MP +10
-- INT +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5577);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 8);
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_INT, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 8);
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_INT, 1);
end;
