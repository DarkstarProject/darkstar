---------------------------------------------
-- Heat Capacitor
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
    automaton:addRecast(dsp.recast.ABILITY, skill:getID(), 90)
    local maneuvers = master:countEffect(dsp.effect.FIRE_MANEUVER)
    skill:setMsg(dsp.msg.basic.TP_INCREASE)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(dsp.effect.FIRE_MANEUVER)
    end
    
    
    if automaton:getLocalVar("heat_capacitor") >= 3 then -- Heat Capacitor & Heat Capacitor II
        target:addTP(1000 * maneuvers)
    elseif automaton:getLocalVar("heat_capacitor") >= 2 then -- Heat Capacitor II
        target:addTP(600 * maneuvers)
    else -- Heat Capacitor
        target:addTP(400 * maneuvers)
    end

    return target:getTP()
end
