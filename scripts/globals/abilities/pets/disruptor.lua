---------------------------------------------
--  Disruptor
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 60)
    local effect = target:dispelStatusEffect()
    if effect ~= EFFECT_NONE then
        skill:setMsg(MSG_DISAPPEAR)
    else
        skill:setMsg(MSG_NO_EFFECT)
    end

    return effect
end
