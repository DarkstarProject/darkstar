-----------------------------------
--
-- Weakness
--
-----------------------------------
require("scripts/globals/status")
function onEffectGain(target, effect)
    --reduce HP and MP by the power amount. Add 100% slow
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(dsp.mod.HPP, -75)
    target:addMod(dsp.mod.MPP, -75)

    -- 100% Slow -- FIXME: Weakness should probably be its own source of slow
    target:addMod(dsp.mod.HASTE_MAGIC, -10000)

    if effect:getPower() == 2 then
        -- handle double weakness
        target:addMod(dsp.mod.RACC, -999)
        target:addMod(dsp.mod.MATT, -999)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    --restore HP and MP to its former state. Remove 100% slow
    target:delMod(dsp.mod.HPP,-75)
    target:delMod(dsp.mod.MPP,-75)
    target:delMod(dsp.mod.HASTE_MAGIC, -10000)

    if (effect:getPower() == 2) then
        -- handle double weakness
        target:delMod(dsp.mod.RACC, -999)
        target:delMod(dsp.mod.MATT,-999)
    end
end
