-----------------------------------
-- Attachment: Mana Tank
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_MPP, 4);
end

function onUnequip(pet)
    pet:delMod(MOD_MPP, 4);
end

function onManeuverGain(pet,maneuvers)
    local bonus = 0
    local frame = pet:getFrame()
    if frame == 0x23 then bonus = 1 end
    if (maneuvers == 1) then
        pet:addMod(MOD_REFRESH, 1 + bonus);
    elseif (maneuvers == 2) then
        pet:addMod(MOD_REFRESH, 1 + bonus); 
    elseif (maneuvers == 3) then
        pet:addMod(MOD_REFRESH, 2 + bonus);
    end
end

function onManeuverLose(pet,maneuvers)
    local bonus = 0
    local frame = pet:getFrame()
    if frame == 0x23 then bonus = 1 end
    if (maneuvers == 1) then
        pet:delMod(MOD_REFRESH, 1 + bonus);
    elseif (maneuvers == 2) then
        pet:delMod(MOD_REFRESH, 1 + bonus); 
    elseif (maneuvers == 3) then
        pet:delMod(MOD_REFRESH, 2 + bonus);
    end
end
