-----------------------------------
-- Attachment: Volt Gun
-- Note that this will reduce ENSPELL_DMG by too much if the automaton skills up while a maneuver is active
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    local skill = math.max(pet:getSkillLevel(22), pet:getSkillLevel(23), pet:getSkillLevel(24))
    pet:addMod(MOD_ENSPELL, 6)
    pet:addMod(MOD_ENSPELL_DMG, skill * 0.1)
    pet:addMod(MOD_ENSPELL_CHANCE, 20)
end

function onUnequip(pet)
    local skill = math.max(pet:getSkillLevel(22), pet:getSkillLevel(23), pet:getSkillLevel(24))
    pet:delMod(MOD_ENSPELL, 6)
    pet:delMod(MOD_ENSPELL_DMG, skill * 0.1)
    pet:delMod(MOD_ENSPELL_CHANCE, 20)
end

function onManeuverGain(pet,maneuvers)
    local skill = math.max(pet:getSkillLevel(22), pet:getSkillLevel(23), pet:getSkillLevel(24))
    pet:addMod(MOD_ENSPELL, 6)
    pet:addMod(MOD_ENSPELL_DMG, skill * 0.05)
    pet:addMod(MOD_ENSPELL_CHANCE, 10)
end

function onManeuverLose(pet,maneuvers)
    local skill = math.max(pet:getSkillLevel(22), pet:getSkillLevel(23), pet:getSkillLevel(24))
    pet:delMod(MOD_ENSPELL, 6)
    pet:delMod(MOD_ENSPELL_DMG, skill * 0.05)
    pet:delMod(MOD_ENSPELL_CHANCE, 10)
end
