---------------------------------------------
-- Replicator
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
    local maneuvers = master:countEffect(dsp.effect.WIND_MANEUVER)
    local duration = 300
    local shadows = 1 + maneuvers -- math.floor(maneuvers * 3.5) currently on retail

    if target:addStatusEffect(dsp.effect.BLINK, shadows, 0, duration) then
        skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)
        for i = 1, maneuvers do
            master:delStatusEffectSilent(dsp.effect.WIND_MANEUVER)
        end
    else
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    end

    return dsp.effect.BLINK
end
