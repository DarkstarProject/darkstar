---------------------------------------------
--  Provoke
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    target:addEnmity(automaton, 1, 1800)
    skill:setMsg(MSG_USES)
    return 0
end
