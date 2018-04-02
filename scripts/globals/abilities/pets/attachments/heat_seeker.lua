-----------------------------------
-- Attachment: Heat Seeker
-----------------------------------
require("scripts/globals/status")

function onEquip(pet)
    pet:addListener("ENGAGE", "AUTO_HEAT_SEEKER_ENGAGE", function(pet, target)
        pet:setLocalVar("heatseekertick", VanadielTime())
    end)
    pet:addListener("AUTOMATON_AI_TICK", "AUTO_HEAT_SEEKER_TICK", function(pet, target)
        if pet:getLocalVar("heatseekertick") > 0 then
            local master = pet:getMaster()
            local maneuvers = master:countEffect(dsp.effects.THUNDER_MANEUVER)
            local lasttick = pet:getLocalVar("heatseekertick")
            local tick = VanadielTime()
            local dt = tick - lasttick
            local prevamount = pet:getLocalVar("heatseeker")
            local amount = 0
            if maneuvers > 0 then
                amount = maneuvers * dt
                if (amount + prevamount) > 30 then
                    amount = 30 - prevamount
                end
                if amount ~= 0 then
                    pet:addMod(MOD_ACC, amount)
                end
            else
                amount = -1 * dt
                if (amount + prevamount) < 0 then
                    amount = -prevamount
                end
                if amount ~= 0 then
                    pet:delMod(MOD_ACC, -amount)
                end
            end
            if amount ~= 0 then
                pet:setLocalVar("heatseeker", prevamount + amount)
            end
            pet:setLocalVar("heatseekertick", tick)
        end
    end)
    pet:addListener("DISENGAGE", "AUTO_HEAT_SEEKER_DISENGAGE", function(pet)
        if pet:getLocalVar("heatseeker") > 0 then
            pet:delMod(MOD_ACC, pet:getLocalVar("heatseeker"))
            pet:setLocalVar("heatseeker", 0)
        end
        pet:setLocalVar("heatseekertick", 0)
    end)
end

function onUnequip(pet)
    pet:removeListener("AUTO_HEAT_SEEKER_ENGAGE")
    pet:removeListener("AUTO_HEAT_SEEKER_TICK")
    pet:removeListener("AUTO_HEAT_SEEKER_DISENGAGE")
end

function onManeuverGain(pet,maneuvers)
end

function onManeuverLose(pet,maneuvers)
end
