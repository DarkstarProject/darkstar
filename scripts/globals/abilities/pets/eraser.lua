---------------------------------------------
--  Eraser
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 30)
    local maneuvers = master:countEffect(EFFECT_LIGHT_MANEUVER)
    skill:setMsg(MSG_USES)

    local function removeStatus()
        if target:delStatusEffect(EFFECT_PETRIFICATION) then return true end
        if target:delStatusEffect(EFFECT_SILENCE) then return true end
        if target:delStatusEffect(EFFECT_BANE) then return true end
        if target:delStatusEffect(EFFECT_CURSE_II) then return true end
        if target:delStatusEffect(EFFECT_CURSE) then return true end
        if target:delStatusEffect(EFFECT_PARALYSIS) then return true end
        if target:delStatusEffect(EFFECT_PLAGUE) then return true end
        if target:delStatusEffect(EFFECT_POISON) then return true end
        if target:delStatusEffect(EFFECT_DISEASE) then return true end
        if target:delStatusEffect(EFFECT_BLINDNESS) then return true end
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
        master:delStatusEffectSilent(EFFECT_LIGHT_MANEUVER)
    end

    return removed
end
