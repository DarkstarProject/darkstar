---------------------------------------------
-- Reactive Shield
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
    automaton:addRecast(dsp.recast.ABILITY, skill:getID(), 65)
    local pMod = automaton:getSkillLevel(dsp.skill.AUTOMATON_MAGIC)
    local duration = 60
    local power = math.floor((pMod/56)^3 / 8) + 4 -- No idea how the actual formula used Automaton skill level, so heres a placeholder (4 @ lvl 1, 10 @ lvl 61, 20 @ lvl 75, 62 @ lvl 99)

    if target:addStatusEffect(dsp.effect.BLAZE_SPIKES, power, 0, duration) then
        skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    end

    return dsp.effect.BLAZE_SPIKES
end
