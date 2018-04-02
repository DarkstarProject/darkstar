-----------------------------------------
-- ID: 4155
-- Item: Remedy
-- Item Effect: This potion remedies status ailments.
-- Works on paralysis, silence, blindness, poison, and disease.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)

    if (target:hasStatusEffect(EFFECT.SILENCE) == true) then
        target:delStatusEffect(EFFECT.SILENCE);
    end
    if (target:hasStatusEffect(EFFECT.BLINDNESS) == true) then
        target:delStatusEffect(EFFECT.BLINDNESS);
    end
    if (target:hasStatusEffect(EFFECT.POISON) == true) then
        target:delStatusEffect(EFFECT.POISON);
    end
    if (target:hasStatusEffect(EFFECT.PARALYSIS) == true) then
        target:delStatusEffect(EFFECT.PARALYSIS);
    end

    local rDisease = math.random(1,2) -- Disease is not garunteed to be cured, 1 means removed 2 means fail. 50% chance
    if (rDisease == 1 and target:hasStatusEffect(EFFECT.DISEASE) == true) then
        target:delStatusEffect(EFFECT.DISEASE);
    end
end;

