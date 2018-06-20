-----------------------------------
-- Attachment: Auto-repair Kit
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    pet:addMod(dsp.mod.HPP, 6)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.HPP, 6)
end

function onManeuverGain(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 1 end
    if (maneuvers == 1) then
        pet:addMod(dsp.mod.REGEN, 3 + bonus);
    elseif (maneuvers == 2) then
        pet:addMod(dsp.mod.REGEN, 4);
    elseif (maneuvers == 3) then
        pet:addMod(dsp.mod.REGEN, 4 + bonus);
    end
end

function onManeuverLose(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 1 end
    if (maneuvers == 1) then
        pet:delMod(dsp.mod.REGEN, 3 + bonus);
    elseif (maneuvers == 2) then
        pet:delMod(dsp.mod.REGEN, 4);
    elseif (maneuvers == 3) then
        pet:delMod(dsp.mod.REGEN, 4 + bonus);
    end
end
