---------------------------------------------
--  Disruptor
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg");
---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    automaton:addRecast(RECAST_ABILITY, skill:getID(), 60)
    local effect = target:dispelStatusEffect()
    if effect ~= EFFECT_NONE then
        skill:setMsg(msgBasic.DISAPPEAR)
    else
        skill:setMsg(msgBasic.NO_EFFECT)
    end

    return effect
end
