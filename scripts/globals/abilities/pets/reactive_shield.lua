---------------------------------------------
--  Reactive Shield
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local pMod = math.max(automaton:getSkillLevel(22), automaton:getSkillLevel(23), automaton:getSkillLevel(24))
    local duration = 60
    local power = math.floor((pMod/56)^3 / 8) + 4 -- No idea how the actual formula used Automaton skill level, so heres a placeholder (4 @ lvl 1, 10 @ lvl 61, 20 @ lvl 75, 62 @ lvl 99)

    if target:addStatusEffect(EFFECT_BLAZE_SPIKES, power, 0, duration) then
        skill:setMsg(MSG_BUFF)
    else
        skill:setMsg(MSG_NO_EFFECT)
    end

    return EFFECT_BLAZE_SPIKES
end