-----------------------------------
-- Attachment: Volt Gun
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    local skill = math.max(pet:getSkillLevel(dsp.skill.AUTOMATON_MELEE), pet:getSkillLevel(dsp.skill.AUTOMATON_RANGED), pet:getSkillLevel(dsp.skill.AUTOMATON_MAGIC))
    pet:addMod(dsp.mod.ENSPELL, 6)
    pet:addMod(dsp.mod.ENSPELL_DMG, skill * 0.1)
    pet:addMod(dsp.mod.ENSPELL_CHANCE, 20)
end

function onUnequip(pet)
    pet:delMod(dsp.mod.ENSPELL, 6)
    pet:delMod(dsp.mod.ENSPELL_DMG, pet:getMod(dsp.mod.ENSPELL_DMG))
    pet:delMod(dsp.mod.ENSPELL_CHANCE, 20)
end

function onManeuverGain(pet, maneuvers)
    local skill = math.max(pet:getSkillLevel(dsp.skill.AUTOMATON_MELEE), pet:getSkillLevel(dsp.skill.AUTOMATON_RANGED), pet:getSkillLevel(dsp.skill.AUTOMATON_MAGIC))
    pet:addMod(dsp.mod.ENSPELL_DMG, skill * 0.05)
    pet:addMod(dsp.mod.ENSPELL_CHANCE, 15)
end

function onManeuverLose(pet, maneuvers)
    local skill = math.max(pet:getSkillLevel(dsp.skill.AUTOMATON_MELEE), pet:getSkillLevel(dsp.skill.AUTOMATON_RANGED), pet:getSkillLevel(dsp.skill.AUTOMATON_MAGIC))
    pet:delMod(dsp.mod.ENSPELL_DMG, skill * 0.05)
    pet:delMod(dsp.mod.ENSPELL_CHANCE, 15)

    -- Hacky way of keeping dsp.mod.ENSPELL_DMG from going negative by simply resetting it
    if maneuvers == 1 and pet:getMod(dsp.mod.ENSPELL_DMG) < 0 then
        pet:delMod(dsp.mod.ENSPELL, pet:getMod(dsp.mod.ENSPELL))
        pet:delMod(dsp.mod.ENSPELL_DMG, pet:getMod(dsp.mod.ENSPELL_DMG))
        pet:delMod(dsp.mod.ENSPELL_CHANCE, pet:getMod(dsp.mod.ENSPELL_CHANCE))
        onEquip(pet)
    end
end
