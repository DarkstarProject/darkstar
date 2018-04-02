-----------------------------------------
-- ID: 4545
-- Item: Bunch of Gysahl Greens
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility +3
-- Vitality -5
-- Additional Effect with Chocobo Shirt
-- Agility +10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,ChocoboShirt(target),0,300,4545);
end;

function onEffectGain(target, effect)
    local power = effect:getPower();
    if (power == 1) then
        chocoboShirt = 1;
        target:addMod(MOD_AGI, 13);
        target:addMod(MOD_VIT, -5);
    else
        target:addMod(MOD_AGI, 3);
        target:addMod(MOD_VIT, -5);
    end
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------
function onEffectLose(target,effect)
    local power = effect:getPower();
    if (power == 1) then
        target:delMod(MOD_AGI, 13);
        target:delMod(MOD_VIT, -5);
    else
        target:delMod(MOD_AGI, 3);
        target:delMod(MOD_VIT, -5);
    end
end;