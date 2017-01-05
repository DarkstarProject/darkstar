-----------------------------------------
-- ID: 4155
-- Item: Remedy
-- Item Effect: This potion remedies status ailments.
--    Works on paralysis, silence, blindness, poison, and disease.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)

    if (target:hasStatusEffect(EFFECT_SILENCE) == true) then
        target:delStatusEffect(EFFECT_SILENCE);
    end
    if (target:hasStatusEffect(EFFECT_BLINDNESS) == true) then
        target:delStatusEffect(EFFECT_BLINDNESS);
    end
    if (target:hasStatusEffect(EFFECT_POISON) == true) then
        target:delStatusEffect(EFFECT_POISON);
    end
    if (target:hasStatusEffect(EFFECT_PARALYSIS) == true) then
        target:delStatusEffect(EFFECT_PARALYSIS);
    end
    
    local rDisease = math.random(1,2) -- Disease is not garunteed to be cured, 1 means removed 2 means fail. 50% chance
    if (rDisease == 1 and target:hasStatusEffect(EFFECT_DISEASE) == true) then
        target:delStatusEffect(EFFECT_DISEASE);
    end    
end;

