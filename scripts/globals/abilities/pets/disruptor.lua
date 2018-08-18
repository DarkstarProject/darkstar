---------------------------------------------
-- Disruptor
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
    automaton:addRecast(dsp.recast.ABILITY, skill:getID(), 60)
    local effect = target:dispelStatusEffect()
    if effect ~= dsp.effect.NONE then
        skill:setMsg(dsp.msg.basic.SKILL_ERASE)
    else
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    end

    return effect
end
