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

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 180)
    local maneuvers = master:countEffect(EFFECT_DARK_MANEUVER)
    local amount = math.floor(automaton:getMaxMP() * 0.2 * maneuvers)
    skill:setMsg(MSG_RECOVER_MP)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(EFFECT_DARK_MANEUVER)
    end

    return automaton:addMP(amount)
end
