-----------------------------------
-- Attachment: Mana Tank III
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    pet:addMod(MOD_MPP, 13);
end

function onUnequip(pet)
    pet:delMod(MOD_MPP, 13);
end

function onManeuverGain(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if (maneuvers == 1) then
        if frame == 0x23 then bonus = 3 end
        pet:addMod(MOD_REFRESH, 7 + bonus);
    elseif (maneuvers == 2) then
        if frame == 0x23 then bonus = 2 end
        pet:addMod(MOD_REFRESH, 1 + bonus);
    elseif (maneuvers == 3) then
        if frame == 0x23 then bonus = 2 end
        pet:addMod(MOD_REFRESH, 2 + bonus);
    end
end

function onManeuverLose(pet,maneuvers)
    local bonus = 0
    local frame = pet:getAutomatonFrame()
    if (maneuvers == 1) then
        if frame == 0x23 then bonus = 3 end
        pet:delMod(MOD_REFRESH, 7 + bonus);
    elseif (maneuvers == 2) then
        if frame == 0x23 then bonus = 2 end
        pet:delMod(MOD_REFRESH, 1 + bonus);
    elseif (maneuvers == 3) then
        if frame == 0x23 then bonus = 2 end
        pet:delMod(MOD_REFRESH, 2 + bonus);
    end
end
