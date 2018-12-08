---------------------------------------------
-- Provoke
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
    automaton:addRecast(dsp.recast.ABILITY, skill:getID(), 30)
    target:addEnmity(automaton, 1, 1800)
    skill:setMsg(dsp.msg.basic.USES)
    return 0
end
