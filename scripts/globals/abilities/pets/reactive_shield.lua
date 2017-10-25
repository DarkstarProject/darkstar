---------------------------------------------
-- Reactive Shield
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 65)
    local pMod = math.max(automaton:getSkillLevel(22), automaton:getSkillLevel(23), automaton:getSkillLevel(24))
    local duration = 60
    local power = math.floor((pMod/56)^3 / 8) + 4 -- No idea how the actual formula used Automaton skill level, so heres a placeholder (4 @ lvl 1, 10 @ lvl 61, 20 @ lvl 75, 62 @ lvl 99)

    if target:addStatusEffect(EFFECT_BLAZE_SPIKES, power, 0, duration) then
        skill:setMsg(msgBasic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(msgBasic.SKILL_NO_EFFECT)
    end

    return EFFECT_BLAZE_SPIKES
end
