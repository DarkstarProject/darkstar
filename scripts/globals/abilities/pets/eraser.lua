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
    local maneuvers = master:countEffect(EFFECT.LIGHT_MANEUVER)
    skill:setMsg(msgBasic.USES)

    local function removeStatus()
        if target:delStatusEffect(EFFECT.PETRIFICATION) then return true end
        if target:delStatusEffect(EFFECT.SILENCE) then return true end
        if target:delStatusEffect(EFFECT.BANE) then return true end
        if target:delStatusEffect(EFFECT.CURSE_II) then return true end
        if target:delStatusEffect(EFFECT.CURSE) then return true end
        if target:delStatusEffect(EFFECT.PARALYSIS) then return true end
        if target:delStatusEffect(EFFECT.PLAGUE) then return true end
        if target:delStatusEffect(EFFECT.POISON) then return true end
        if target:delStatusEffect(EFFECT.DISEASE) then return true end
        if target:delStatusEffect(EFFECT.BLINDNESS) then return true end
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
        master:delStatusEffectSilent(EFFECT.LIGHT_MANEUVER)
    end

    return removed
end
