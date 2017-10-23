---------------------------------------------
-- Mana Converter
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
    local hp = target:getHP()
    local duration = 30
    local amount = math.floor((hp/2)/10)
    local difference = math.ceil(hp/2 - (amount*10))
    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT)

    target:addMP(difference) -- To prevent possible loss of MP from flooring the refresh
    target:setHP(math.floor(hp/2))
    target:delStatusEffect(EFFECT_REFRESH)
    target:addStatusEffect(EFFECT_REFRESH, amount, 3, duration)

    return EFFECT_REFRESH
end
