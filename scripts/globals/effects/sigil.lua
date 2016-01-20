-----------------------------------
--
-- EFFECT_SIGIL
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower(); -- Tracks which bonus effects are in use.
    local subPower = effect:getSubPower(); -- subPower sets % required to trigger regen/refresh.

    if (power == 1 or power == 3 or power == 5 or power == 7 or power == 9 or power == 11 or power == 13 or power == 15) then
        -- target:addLatent(LATENT_SIGIL_REGEN, subPower+10, MOD_REGEN, 1);
        -- Not yet implemented
    end

    if (power == 2 or power == 3 or power == 6 or power == 7 or power == 10 or power == 11 or power >= 14) then
        -- target:addLatent(LATENT_SIGIL_REFRESH, subPower, MOD_REFRESH, 1);
        -- Not yet implemented
    end

    if (power >= 4 and power <= 7) then
        -- target:addMod(MOD_FOOD_DURATION), ???);
        -- food duration not implemented.
    elseif (power >= 8 and power <= 11) then
        -- target:addMod(MOD_EXPLOSS_REDUCTION), ???);
        -- exp loss reduction not implemented.
    elseif (power >= 12) then
        -- Possibly handle exp loss reduction in core instead..Maybe the food bonus also?
        -- target:addMod(MOD_FOOD_DURATION), ???);
        -- food duration not implemented.
        -- target:addLatent(LATENT_SIGIL_EXPLOSS, ?, MOD_EXPLOSS_REDUCTION, ?);
        -- exp loss reduction not implemented.
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local power = effect:getPower(); -- Tracks which bonus effects are in use.
    local subPower = effect:getSubPower(); -- subPower sets % required to trigger regen/refresh.

    if (power == 1 or power == 3 or power == 5 or power == 7 or power == 9 or power == 11 or power == 13 or power == 15) then
        -- target:delLatent(LATENT_SIGIL_REGEN, subPower+10, MOD_REGEN, 1);
        -- Not yet implemented
    end

    if (power == 2 or power == 3 or power == 6 or power == 7 or power == 10 or power == 11 or power >= 14) then
        -- target:delLatent(LATENT_SIGIL_REFRESH, subPower, MOD_REFRESH, 1);
        -- Not yet implemented
    end

    if (effect:getPower() >= 4 and effect:getPower() <= 7) then
        -- target:delMod(MOD_FOOD_DURATION), ???);
        -- food duration not implemented.
    elseif (effect:getPower() >= 8 and effect:getPower() <= 11) then
        -- target:delMod(MOD_EXPLOSS_REDUCTION), ???);
        -- exp loss reduction not implemented.
    elseif (effect:getPower() >= 12) then
        -- target:delMod(MOD_FOOD_DURATION), ???);
        -- food duration not implemented.
        -- target:delMod(MOD_EXPLOSS_REDUCTION), ???);
        -- exp loss reduction not implemented.
    end
end;
