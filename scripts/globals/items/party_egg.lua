-----------------------------------------
-- ID: 4595
-- Item: party_egg
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 25
-- Magic 25
-- Attack 5
-- Ranged Attack 4
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,3600,4595);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_MP, 25);
    target:addMod(MOD_ATT, 5);
    target:addMod(MOD_RATT, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_MP, 25);
    target:delMod(MOD_ATT, 5);
    target:delMod(MOD_RATT, 4);
end;
