-----------------------------------
-- Attachment: Volt Gun
-----------------------------------
require("scripts/globals/status");

function onEquip(pet)
    local skill = math.max(pet:getSkillLevel(22), pet:getSkillLevel(23), pet:getSkillLevel(24))
    pet:addMod(MOD_ENSPELL, 6)
    pet:addMod(MOD_ENSPELL_DMG, skill * 0.05)
    pet:addMod(MOD_ENSPELL_CHANCE, 20)
end

function onUnequip(pet)
    pet:delMod(MOD_ENSPELL, 6)
    pet:delMod(MOD_ENSPELL_DMG, pet:getMod(MOD_ENSPELL_DMG))
    pet:delMod(MOD_ENSPELL_CHANCE, 20)
end

function onManeuverGain(pet,maneuvers)
    local skill = math.max(pet:getSkillLevel(22), pet:getSkillLevel(23), pet:getSkillLevel(24))
    pet:addMod(MOD_ENSPELL_DMG, skill * 0.025)
    pet:addMod(MOD_ENSPELL_CHANCE, 15)
end

function onManeuverLose(pet,maneuvers)
    local skill = math.max(pet:getSkillLevel(22), pet:getSkillLevel(23), pet:getSkillLevel(24))
    pet:delMod(MOD_ENSPELL_DMG, skill * 0.025)
    pet:delMod(MOD_ENSPELL_CHANCE, 15)

    -- Hacky way of keeping MOD_ENSPELL_DMG from going negative by simply resetting it
    if maneuvers == 1 and pet:getMod(MOD_ENSPELL_DMG) < 0 then
        pet:delMod(MOD_ENSPELL, pet:getMod(MOD_ENSPELL))
        pet:delMod(MOD_ENSPELL_DMG, pet:getMod(MOD_ENSPELL_DMG))
        pet:delMod(MOD_ENSPELL_CHANCE, pet:getMod(MOD_ENSPELL_CHANCE))
        onEquip(pet)
    end
end
