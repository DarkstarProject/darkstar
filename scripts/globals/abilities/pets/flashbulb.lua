---------------------------------------------
-- Flashbulb
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(dsp.recast.ABILITY, skill:getID(), 45)
    local highest = automaton:getSkillLevel(dsp.skill.AUTOMATON_MELEE)
    local highestskill = 22
    if automaton:getSkillLevel(dsp.skill.AUTOMATON_RANGED) > highest then
        highestskill = 23
        highest = automaton:getSkillLevel(dsp.skill.AUTOMATON_RANGED)
    end
    if automaton:getSkillLevel(dsp.skill.AUTOMATON_MAGIC) > highest then
        highestskill = 24
    end

    local resist = applyResistanceAbility(automaton, target, 7, highestskill, 150)
    local duration = 12 * resist

    if resist > 0.0625 then
        if target:addStatusEffect(dsp.effect.FLASH, 200, 0, duration) then
            skill:setMsg(dsp.msg.basic.SKILL_ENFEEB)
        else
            skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
        end
    else
        skill:setMsg(dsp.msg.basic.RESIST)
    end

    return dsp.effect.FLASH
end
