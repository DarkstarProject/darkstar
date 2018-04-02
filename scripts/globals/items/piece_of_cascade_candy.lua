-----------------------------------------
-- ID: 5942
-- Item: Piece of Cascade Candy
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Mind +4
-- Charisma +4
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
    target:addStatusEffect(EFFECT.FOOD,0,0,1800,5942);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MND, 4);
    target:addMod(MOD_CHR, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MND, 4);
    target:delMod(MOD_CHR, 4);
end;
