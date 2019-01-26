-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getSubType() == dsp.mod.DMG) then
        target:addMod(dsp.mod.DMG, effect:getPower())
    else
        if (effect:getSubType() == dsp.mod.ACC) then
            target:addMod(dsp.mod.RACC, -effect:getPower())
        elseif (effect:getSubType() == dsp.mod.ATTP) then
            target:addMod(dsp.mod.RATTP, -effect:getPower())
        -- elseif (effect:getSubType() == MOD_PET_MACC) then
        --     target:addMod(MOD_PET_MATT, -effect:getPower())
        end
        target:addMod(effect:getSubType(), -effect:getPower())
    end
    --print("added "..effect:getPower().." of mod "..effect:getSubType())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    if (effect:getSubType() == dsp.mod.DMG) then
        target:delMod(dsp.mod.DMG, effect:getPower())
    else
        if (effect:getSubType() == dsp.mod.ACC) then
            target:delMod(dsp.mod.RACC, -effect:getPower())
        elseif (effect:getSubType() == dsp.mod.ATTP) then
            target:delMod(dsp.mod.RATTP, -effect:getPower())
        -- elseif (effect:getSubType() == MOD_PET_MACC) then
        --     target:delMod(MOD_PET_MATT, -effect:getPower())
        end
        target:delMod(effect:getSubType(), -effect:getPower())
    end
    --print("removed "..effect:getPower().." of mod "..effect:getSubType())
end
