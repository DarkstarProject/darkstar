-----------------------------------
-- Attachment: Auto-repair Kit III
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addMod(dsp.mod.HPP, 19)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.HPP, 19)
end

function onManeuverGain(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if (maneuvers == 1) then
        if frame == 0x20 then bonus = 4 end
        if frame == 0x21 then bonus = 6 end
        if frame == 0x22 then bonus = 2 end
        pet:addMod(dsp.mod.REGEN, 37 + bonus);
    elseif (maneuvers == 2) then
        if frame == 0x20 then bonus = 3 end
        if frame == 0x21 then bonus = 4 end
        if frame == 0x22 then bonus = 1 end
        pet:addMod(dsp.mod.REGEN, 10 + bonus);
    elseif (maneuvers == 3) then
        if frame == 0x20 then bonus = 3 end
        if frame == 0x21 then bonus = 4 end
        pet:addMod(dsp.mod.REGEN, 10 + bonus);
    end
end

function onManeuverLose(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if (maneuvers == 1) then
        if frame == 0x20 then bonus = 4 end
        if frame == 0x21 then bonus = 6 end
        if frame == 0x22 then bonus = 2 end
        pet:delMod(dsp.mod.REGEN, 37 + bonus);
    elseif (maneuvers == 2) then
        if frame == 0x20 then bonus = 3 end
        if frame == 0x21 then bonus = 4 end
        if frame == 0x22 then bonus = 1 end
        pet:delMod(dsp.mod.REGEN, 10 + bonus);
    elseif (maneuvers == 3) then
        if frame == 0x20 then bonus = 3 end
        if frame == 0x21 then bonus = 4 end
        pet:delMod(dsp.mod.REGEN, 10 + bonus);
    end
end
