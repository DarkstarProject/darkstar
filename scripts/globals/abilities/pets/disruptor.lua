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

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local effect = target:dispelStatusEffect()
    if effect ~= EFFECT_NONE then
        skill:setMsg(MSG_DISAPPEAR)
    else
        skill:setMsg(MSG_NO_EFFECT)
    end

    return effect
end
