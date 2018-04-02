-----------------------------------------
-- ID: 5356
-- Item: Remedy Ointment
-- Item Effect: This potion remedies status ailments.
-- Works on paralysis, silence, blindness, poison, and plague.
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effects.SILENCE) or target:hasStatusEffect(dsp.effects.BLINDNESS) or target:hasStatusEffect(dsp.effects.POISON) or target:hasStatusEffect(dsp.effects.PARALYSIS) or target:hasStatusEffect(dsp.effects.PLAGUE)) then
        local effectRemoved = 0;
        while effectRemoved == 0 do
            num = math.random(1,5);
            if (num == 1 and target:hasStatusEffect(dsp.effects.SILENCE)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(dsp.effects.SILENCE);

            elseif (num == 2 and target:hasStatusEffect(dsp.effects.BLINDNESS)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(dsp.effects.BLINDNESS);

            elseif (num == 3 and target:hasStatusEffect(dsp.effects.POISON)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(dsp.effects.POISON);

            elseif (num == 4 and target:hasStatusEffect(dsp.effects.PARALYSIS)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(dsp.effects.PARALYSIS);

            elseif (num == 5 and target:hasStatusEffect(dsp.effects.PLAGUE)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(dsp.effects.PLAGUE);
            end
        end
    end
end;

