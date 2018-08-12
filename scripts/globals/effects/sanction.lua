-----------------------------------
--
-- dsp.effect.SANCTION
--
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower(); -- 1 = regen, 2 = refresh, 3 = food.
    local subPower = effect:getSubPower(); -- subPower sets % required to trigger regen/refresh.

    -- target:addLatent(LATENT_SANCTION_EXP, ?, dsp.mod.EXP_BONUS, ?);
    -- Possibly handle exp bonus in core instead

    if (power == 1) then
        -- target:addLatent(LATENT_SANCTION_REGEN, subPower, dsp.mod.REGEN, 1);
    elseif (power == 2) then
        -- target:addLatent(LATENT_SANCTION_REFRESH, subPower, dsp.mod.REFRESH, 1);
    elseif (power == 3) then
        -- target:addMod(dsp.mod.FOOD_DURATION), ???);
        -- food duration not implemented.
    end
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    local power = effect:getPower(); -- 1 = regen, 2 = refresh, 3 = food.
    local subPower = effect:getSubPower(); -- subPower sets % required to trigger regen/refresh.

    -- target:delLatent(LATENT_SANCTION_EXP, ?, dsp.mod.EXP_BONUS, ?);

    if (power == 1) then
        -- target:delLatent(LATENT_SANCTION_REGEN, subPower, dsp.mod.REGEN, 1);
    elseif (power == 2) then
        -- target:delLatent(LATENT_SANCTION_REFRESH, subPower, dsp.mod.REFRESH, 1);
    elseif (power == 3) then
        -- target:delMod(dsp.mod.FOOD_DURATION), ???);
        -- food duration not implemented.
    end
end;
