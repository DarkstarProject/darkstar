---------------------------------------------
--  Economizer
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local maneuvers = master:countEffect(EFFECT_DARK_MANEUVER)
    local amount = math.floor(automaton:getMaxMP() * 0.2 * maneuvers)
    skill:setMsg(224) -- no message for this, recovers MP

    for i = 1, maneuvers do
        master:delStatusEffectSilent(EFFECT_DARK_MANEUVER)
    end

    return automaton:addMP(amount)
end
