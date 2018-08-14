-----------------------------------
--
-- dsp.effect.DEX_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    if ((target:getStat(dsp.mod.DEX) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(dsp.mod.DEX))
    end
    target:addMod(dsp.mod.DEX,-effect:getPower())
end

function onEffectTick(target,effect)
    -- the effect restore dexterity of 1 every 3 ticks.
    local downDEX_effect_size = effect:getPower()
    if (downDEX_effect_size > 0) then
        effect:setPower(downDEX_effect_size - 1)
        target:delMod(dsp.mod.DEX,-1)
    end
end

function onEffectLose(target,effect)
    downDEX_effect_size = effect:getPower()
    if (downDEX_effect_size > 0) then
        target:delMod(dsp.mod.DEX,-downDEX_effect_size)
    end
end
