---------------------------------------------
-- Economizer
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
    automaton:addRecast(dsp.recast.ABILITY, skill:getID(), 180)
    local maneuvers = master:countEffect(dsp.effect.DARK_MANEUVER)
    local amount = math.floor(automaton:getMaxMP() * 0.2 * maneuvers)
    skill:setMsg(dsp.msg.basic.SKILL_RECOVERS_MP)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(dsp.effect.DARK_MANEUVER)
    end

    return automaton:addMP(amount)
end
