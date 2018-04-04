---------------------------------------------
-- Eraser
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
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 30)
    local maneuvers = master:countEffect(dsp.effects.LIGHT_MANEUVER)
    skill:setMsg(msgBasic.USES)

    local function removeStatus()
        if target:delStatusEffect(dsp.effects.PETRIFICATION) then return true end
        if target:delStatusEffect(dsp.effects.SILENCE) then return true end
        if target:delStatusEffect(dsp.effects.BANE) then return true end
        if target:delStatusEffect(dsp.effects.CURSE_II) then return true end
        if target:delStatusEffect(dsp.effects.CURSE) then return true end
        if target:delStatusEffect(dsp.effects.PARALYSIS) then return true end
        if target:delStatusEffect(dsp.effects.PLAGUE) then return true end
        if target:delStatusEffect(dsp.effects.POISON) then return true end
        if target:delStatusEffect(dsp.effects.DISEASE) then return true end
        if target:delStatusEffect(dsp.effects.BLINDNESS) then return true end
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
        master:delStatusEffectSilent(dsp.effects.LIGHT_MANEUVER)
    end

    return removed
end
