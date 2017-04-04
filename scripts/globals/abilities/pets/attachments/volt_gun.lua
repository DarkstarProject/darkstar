-----------------------------------
-- Attachment: Volt Gun
-- Note that this will reduce ENSPELL_DMG by too much if the automaton skills up while a maneuver is active
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onEquip(pet)
    local magicskill = pet:getSkillLevel(34) --ENHANCING_MAGIC_SKILL
    pet:addMod(MOD_ENSPELL, 6)
    pet:addMod(MOD_ENSPELL_DMG, magicskill * 0.1)
    pet:addMod(MOD_ENSPELL_CHANCE, 20)
end

function onUnequip(pet)
    local magicskill = pet:getSkillLevel(34) --ENHANCING_MAGIC_SKILL
    pet:delMod(MOD_ENSPELL, 6)
    pet:delMod(MOD_ENSPELL_DMG, magicskill * 0.1)
    pet:delMod(MOD_ENSPELL_CHANCE, 20)
end

function onManeuverGain(pet,maneuvers)
    local magicskill = pet:getSkillLevel(34) --ENHANCING_MAGIC_SKILL
    pet:addMod(MOD_ENSPELL, 6)
    pet:addMod(MOD_ENSPELL_DMG, magicskill * 0.05)
    pet:addMod(MOD_ENSPELL_CHANCE, 10)
end

function onManeuverLose(pet,maneuvers)
    local magicskill = pet:getSkillLevel(34) --ENHANCING_MAGIC_SKILL
    pet:delMod(MOD_ENSPELL, 6)
    pet:delMod(MOD_ENSPELL_DMG, magicskill * 0.05)
    pet:delMod(MOD_ENSPELL_CHANCE, 10)
end
