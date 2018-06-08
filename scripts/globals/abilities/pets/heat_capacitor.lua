---------------------------------------------
-- Heat Capacitor
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
    automaton:addRecast(dsp.recast.ABILITY, skill:getID(), 90)
    local maneuvers = master:countEffect(dsp.effect.FIRE_MANEUVER)
    skill:setMsg(dsp.msg.basic.TP_INCREASE)

    target:addTP(400 * maneuvers)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(dsp.effect.FIRE_MANEUVER)
    end

    return target:getTP()
end
