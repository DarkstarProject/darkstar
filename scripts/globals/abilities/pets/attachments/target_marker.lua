-----------------------------------
-- Attachment: Target Marker
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addListener("ENGAGE", "AUTO_TARGETMARKER_ENGAGE", function(pet, target)
        local ignored = pet:getLocalVar("targetmarker")
        if ignored > 0 then
            pet:delMod(dsp.mod.ACC, ignored)
            pet:setLocalVar("targetmarker", 0)
        end

        if pet:getMainLvl() < target:getMainLvl() then
            local master = pet:getMaster()
            local maneuvers = master:countEffect(dsp.effect.THUNDER_MANEUVER)
            local eva = target:getEVA()
            local percentage = 0.05
            if maneuvers == 1 then
                percentage = 0.15
            elseif maneuvers == 2 then
                percentage = 0.30
            elseif maneuvers == 3 then
                percentage = 0.45
            end
            local accbonus = math.floor(eva * percentage)
            pet:addMod(dsp.mod.ACC, accbonus)
            pet:setLocalVar("targetmarker", accbonus)
        end
    end)
    pet:addListener("DISENGAGE", "AUTO_TARGETMARKER_DISENGAGE", function(pet)
        local ignored = pet:getLocalVar("targetmarker")
        if ignored > 0 then
            pet:delMod(dsp.mod.ACC, ignored)
            pet:setLocalVar("targetmarker", 0)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("AUTO_TARGETMARKER_ENGAGE")
    pet:removeListener("AUTO_TARGETMARKER_DISENGAGE")
end

function onManeuverGain(pet, maneuvers)
    local ignored = pet:getLocalVar("targetmarker")
    local target = pet:getTarget()
    if ignored > 0 and target then
        local eva = target:getEVA()
        local percentage = 0.05
        if maneuvers == 1 then
            percentage = 0.15
        elseif maneuvers == 2 then
            percentage = 0.30
        elseif maneuvers == 3 then
            percentage = 0.45
        end
        local accbonus = math.floor(eva * percentage)
        pet:addMod(dsp.mod.ACC, accbonus - ignored)
        pet:setLocalVar("targetmarker", accbonus)
    end
end

function onManeuverLose(pet, maneuvers)
    local ignored = pet:getLocalVar("targetmarker")
    local target = pet:getTarget()
    if ignored > 0 and target then
        local eva = target:getEVA()
        local percentage = 0.05
        if maneuvers == 1 then
            percentage = 0.05
        elseif maneuvers == 2 then
            percentage = 0.15
        elseif maneuvers == 3 then
            percentage = 0.30
        end
        local accbonus = math.floor(eva * percentage)
        pet:delMod(dsp.mod.ACC, ignored - accbonus)
        pet:setLocalVar("targetmarker", accbonus)
    end
end
