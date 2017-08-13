---------------------------------------------
--  Heat Capacitor
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local maneuvers = master:countEffect(EFFECT_FIRE_MANEUVER)
    skill:setMsg(MSG_TP_INCREASE)

    target:addTP(400 * maneuvers)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(EFFECT_FIRE_MANEUVER)
    end

    return target:getTP()
end
