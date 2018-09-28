-----------------------------------
-- Attachment: Auto-repair Kit II
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addMod(dsp.mod.HPP, 13)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.HPP, 13)
end

function onManeuverGain(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 2 end
    if (maneuvers == 1) then
        pet:addMod(dsp.mod.REGEN, 11 + bonus);
    elseif (maneuvers == 2) then
        if frame == 0x22 then bonus = 1 end
        pet:addMod(dsp.mod.REGEN, 11 + bonus);
    elseif (maneuvers == 3) then
        pet:addMod(dsp.mod.REGEN, 11 + bonus);
    end
end

function onManeuverLose(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 2 end
    if (maneuvers == 1) then
        pet:delMod(dsp.mod.REGEN, 11 + bonus);
    elseif (maneuvers == 2) then
        if frame == 0x22 then bonus = 1 end
        pet:delMod(dsp.mod.REGEN, 11 + bonus);
    elseif (maneuvers == 3) then
        pet:delMod(dsp.mod.REGEN, 11 + bonus);
    end
end
