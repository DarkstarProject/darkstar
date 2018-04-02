-----------------------------------
-- Attachment: Attuner
-----------------------------------
require("scripts/globals/status")

function onEquip(pet)
    pet:addListener("ENGAGE", "AUTO_ATTUNER_ENGAGE", function(pet, target)
        local master = pet:getMaster()
        if pet:getLocalVar("attuner") > 0 then
            pet:delMod(MOD_ATTP, 5) -- Ignore 5% def
            pet:delMod(MOD_RATTP, 5)
            for maneuvers = master:countEffect(dsp.effects.FIRE_MANEUVER), 1, -1  do
                if maneuvers == 1 then
                    pet:delMod(MOD_ATTP, 13) -- Ignore 15% def
                    pet:delMod(MOD_RATTP, 13)
                elseif maneuvers == 2 then
                    pet:delMod(MOD_ATTP, 25) -- Ignore 30% def
                    pet:delMod(MOD_RATTP, 25)
                elseif maneuvers == 3 then
                    pet:delMod(MOD_ATTP, 39) -- Ignore 45% def
                    pet:delMod(MOD_RATTP, 39)
                end
            end
            pet:setLocalVar("attuner", 0)
        end

        if pet:getMainLvl() < target:getMainLvl() then
            pet:setLocalVar("attuner", 1)
            pet:addMod(MOD_ATTP, 5) -- Ignore 5% def
            pet:addMod(MOD_RATTP, 5)
            for maneuvers = 1, master:countEffect(dsp.effects.FIRE_MANEUVER) do
                if maneuvers == 1 then
                    pet:addMod(MOD_ATTP, 13) -- Ignore 15% def
                    pet:addMod(MOD_RATTP, 13)
                elseif maneuvers == 2 then
                    pet:addMod(MOD_ATTP, 25) -- Ignore 30% def
                    pet:addMod(MOD_RATTP, 25)
                elseif maneuvers == 3 then
                    pet:addMod(MOD_ATTP, 39) -- Ignore 45% def
                    pet:addMod(MOD_RATTP, 39)
                end
            end
        end
    end)
    pet:addListener("DISENGAGE", "AUTO_ATTUNER_DISENGAGE", function(pet)
        if pet:getLocalVar("attuner") > 0 then
            local master = pet:getMaster()
            pet:delMod(MOD_ATTP, 5) -- Ignore 5% def
            pet:delMod(MOD_RATTP, 5)
            for maneuvers = master:countEffect(dsp.effects.FIRE_MANEUVER), 1, -1  do
                if maneuvers == 1 then
                    pet:delMod(MOD_ATTP, 13) -- Ignore 15% def
                    pet:delMod(MOD_RATTP, 13)
                elseif maneuvers == 2 then
                    pet:delMod(MOD_ATTP, 25) -- Ignore 30% def
                    pet:delMod(MOD_RATTP, 25)
                elseif maneuvers == 3 then
                    pet:delMod(MOD_ATTP, 39) -- Ignore 45% def
                    pet:delMod(MOD_RATTP, 39)
                end
            end
            pet:setLocalVar("attuner", 0)
        end
    end)
end

function onUnequip(pet)
    pet:removeListener("AUTO_ATTUNER_ENGAGE")
    pet:removeListener("AUTO_ATTUNER_DISENGAGE")
end

function onManeuverGain(pet,maneuvers)
    if pet:getLocalVar("attuner") > 0 then
        if maneuvers == 1 then
            pet:addMod(MOD_ATTP, 13) -- Ignore 15% def
            pet:addMod(MOD_RATTP, 13)
        elseif maneuvers == 2 then
            pet:addMod(MOD_ATTP, 25) -- Ignore 30% def
            pet:addMod(MOD_RATTP, 25)
        elseif maneuvers == 3 then
            pet:addMod(MOD_ATTP, 39) -- Ignore 45% def
            pet:addMod(MOD_RATTP, 39)
        end
    end
end

function onManeuverLose(pet,maneuvers)
    if pet:getLocalVar("attuner") > 0 then
        if maneuvers == 1 then
            pet:delMod(MOD_ATTP, 13) -- Ignore 15% def
            pet:delMod(MOD_RATTP, 13)
        elseif maneuvers == 2 then
            pet:delMod(MOD_ATTP, 25) -- Ignore 30% def
            pet:delMod(MOD_RATTP, 25)
        elseif maneuvers == 3 then
            pet:delMod(MOD_ATTP, 39) -- Ignore 45% def
            pet:delMod(MOD_RATTP, 39)
        end
    end
end
