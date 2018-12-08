-----------------------------------
--
-- dsp.effect.SANCTION
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    -- target:addLatent(dsp.latent.SANCTION_EXP, ?, dsp.mod.EXP_BONUS, ?)
    -- Possibly handle exp bonus in core instead

    local power = effect:getPower()
    if power == 1 then
        target:addLatent(dsp.latent.SANCTION_REGEN_BONUS, 95, dsp.mod.REGEN, 1)
    elseif power == 2 then
        target:addLatent(dsp.latent.SANCTION_REFRESH_BONUS, 75, dsp.mod.REFRESH, 1)
    elseif power == 3 then
        target:addMod(dsp.mod.FOOD_DURATION, 100)
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    -- target:delLatent(dsp.latent.SANCTION_EXP, ?, dsp.mod.EXP_BONUS, ?)

    local power = effect:getPower()
    if power == 1 then
        target:delLatent(dsp.latent.SANCTION_REGEN_BONUS, 95, dsp.mod.REGEN, 1)
    elseif power == 2 then
        target:delLatent(dsp.latent.SANCTION_REFRESH_BONUS, 75, dsp.mod.REFRESH, 1)
    elseif power == 3 then
        target:delMod(dsp.mod.FOOD_DURATION, 100)
    end
end
