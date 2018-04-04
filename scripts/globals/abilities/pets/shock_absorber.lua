---------------------------------------------
-- Shock Absorber
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
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 180)
    local maneuvers = master:countEffect(dsp.effects.EARTH_MANEUVER)
    local pMod = math.max(automaton:getSkillLevel(22), automaton:getSkillLevel(23), automaton:getSkillLevel(24))
    local duration = 180
    local amount = 200
    local bonus = 0

    if automaton:getLocalVar("shockabsorber") >= 4 then -- Shock Absorber III
        if maneuvers == 1 then
            bonus = pMod * 0.6
        elseif maneuvers == 2 then
            bonus = pMod * 1.0
        elseif maneuvers == 3 then
            bonus = pMod * 1.4
        end
    elseif automaton:getLocalVar("shockabsorber") >= 2 then -- Shock Absorber II
        if maneuvers == 1 then
            bonus = pMod * 0.4
        elseif maneuvers == 2 then
            bonus = pMod * 0.75
        elseif maneuvers == 3 then
            bonus = pMod * 1.0
        end
    else -- Shock Absorber
        if maneuvers == 1 then
            bonus = pMod * 0.2
        elseif maneuvers == 2 then
            bonus = pMod * 0.4
        elseif maneuvers == 3 then
            bonus = pMod * 0.75
        end
    end
    amount = amount + math.floor(bonus)

    if target:addStatusEffect(dsp.effects.STONESKIN, amount, 0, duration) then
        skill:setMsg(msgBasic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(msgBasic.SKILL_NO_EFFECT)
    end

    return dsp.effects.STONESKIN
end
