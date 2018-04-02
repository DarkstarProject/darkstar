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

    if (target:hasStatusEffect(dsp.effects.SILENCE) == true) then
        target:delStatusEffect(dsp.effects.SILENCE);
    end
    if (target:hasStatusEffect(dsp.effects.BLINDNESS) == true) then
        target:delStatusEffect(dsp.effects.BLINDNESS);
    end
    if (target:hasStatusEffect(dsp.effects.POISON) == true) then
        target:delStatusEffect(dsp.effects.POISON);
    end
    if (target:hasStatusEffect(dsp.effects.PARALYSIS) == true) then
        target:delStatusEffect(dsp.effects.PARALYSIS);
    end

    local rDisease = math.random(1,2) -- Disease is not garunteed to be cured, 1 means removed 2 means fail. 50% chance
    if (rDisease == 1 and target:hasStatusEffect(dsp.effects.DISEASE) == true) then
        target:delStatusEffect(dsp.effects.DISEASE);
    end
end;

