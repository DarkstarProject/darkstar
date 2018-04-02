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
    if (target:hasStatusEffect(EFFECT.SILENCE) or target:hasStatusEffect(EFFECT.BLINDNESS) or target:hasStatusEffect(EFFECT.POISON) or target:hasStatusEffect(EFFECT.PARALYSIS) or target:hasStatusEffect(EFFECT.PLAGUE)) then
        local effectRemoved = 0;
        while effectRemoved == 0 do
            num = math.random(1,5);
            if (num == 1 and target:hasStatusEffect(EFFECT.SILENCE)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(EFFECT.SILENCE);

            elseif (num == 2 and target:hasStatusEffect(EFFECT.BLINDNESS)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(EFFECT.BLINDNESS);

            elseif (num == 3 and target:hasStatusEffect(EFFECT.POISON)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(EFFECT.POISON);

            elseif (num == 4 and target:hasStatusEffect(EFFECT.PARALYSIS)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(EFFECT.PARALYSIS);

            elseif (num == 5 and target:hasStatusEffect(EFFECT.PLAGUE)) then
                effectRemoved = effectRemoved + 1;
                target:delStatusEffect(EFFECT.PLAGUE);
            end
        end
    end
end;

