-----------------------------------
-- Attachment: Auto-repair Kit
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_HPP, 6)
end

function onUnequip(pet)
    pet:delMod(MOD_HPP, 6)
end

function onManeuverGain(pet,maneuvers)
    local bonus = 0
    local frame = pet:getFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 1 end
    if (maneuvers == 1) then
        pet:addMod(MOD_REGEN, 3 + bonus);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_REGEN, 4); 
    elseif (maneuvers == 3) then
        pet:addMod(MOD_REGEN, 4 + bonus);
    end
end

function onManeuverLose(pet,maneuvers)
    local bonus = 0
    local frame = pet:getFrame()
    if frame == 0x20 or frame == 0x21 then bonus = 1 end
    if (maneuvers == 1) then
        pet:delMod(MOD_REGEN, 3 + bonus);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_REGEN, 4); 
    elseif (maneuvers == 3) then
        pet:delMod(MOD_REGEN, 4 + bonus);
    end
end
