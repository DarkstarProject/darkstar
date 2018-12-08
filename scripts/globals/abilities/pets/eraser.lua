---------------------------------------------
-- Eraser
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
    local maneuvers = master:countEffect(dsp.effect.LIGHT_MANEUVER)
    skill:setMsg(dsp.msg.basic.USES)

    local function removeStatus()
        if target:delStatusEffect(dsp.effect.PETRIFICATION) then return true end
        if target:delStatusEffect(dsp.effect.SILENCE) then return true end
        if target:delStatusEffect(dsp.effect.BANE) then return true end
        if target:delStatusEffect(dsp.effect.CURSE_II) then return true end
        if target:delStatusEffect(dsp.effect.CURSE) then return true end
        if target:delStatusEffect(dsp.effect.PARALYSIS) then return true end
        if target:delStatusEffect(dsp.effect.PLAGUE) then return true end
        if target:delStatusEffect(dsp.effect.POISON) then return true end
        if target:delStatusEffect(dsp.effect.DISEASE) then return true end
        if target:delStatusEffect(dsp.effect.BLINDNESS) then return true end
        if target:eraseStatusEffect() ~= 255 then return true end
        return false
    end

    local toremove = maneuvers
    local removed = 0

    repeat
        if not removeStatus() then break end
        toremove = toremove - 1
        removed = removed + 1
    until (toremove <= 0)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(dsp.effect.LIGHT_MANEUVER)
    end

    return removed
end
