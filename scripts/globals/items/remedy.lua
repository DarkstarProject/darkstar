-----------------------------------------
-- ID: 4155
-- Item: Remedy
-- Item Effect: This potion remedies status ailments.
-- Works on paralysis, silence, blindness, poison, and disease.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)

    if (target:hasStatusEffect(dsp.effect.SILENCE) == true) then
        target:delStatusEffect(dsp.effect.SILENCE)
    end
    if (target:hasStatusEffect(dsp.effect.BLINDNESS) == true) then
        target:delStatusEffect(dsp.effect.BLINDNESS)
    end
    if (target:hasStatusEffect(dsp.effect.POISON) == true) then
        target:delStatusEffect(dsp.effect.POISON)
    end
    if (target:hasStatusEffect(dsp.effect.PARALYSIS) == true) then
        target:delStatusEffect(dsp.effect.PARALYSIS)
    end

    local rDisease = math.random(1,2) -- Disease is not garunteed to be cured, 1 means removed 2 means fail. 50% chance
    if (rDisease == 1 and target:hasStatusEffect(dsp.effect.DISEASE) == true) then
        target:delStatusEffect(dsp.effect.DISEASE)
    end
end

