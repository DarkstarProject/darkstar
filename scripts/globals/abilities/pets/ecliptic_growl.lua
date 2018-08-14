---------------------------------------------
-- Ecliptic Growl
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(dsp.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    local moon = VanadielMoonPhase()
    local buffvalue = 0
    if moon > 90 then
        buffvalue = 7
    elseif moon > 75 then
        buffvalue = 6
    elseif moon > 60 then
        buffvalue = 5
    elseif moon > 40 then
        buffvalue = 4
    elseif moon > 25 then
        buffvalue = 3
    elseif moon > 10 then
        buffvalue = 2
    else
        buffvalue = 1
    end
    target:delStatusEffect(dsp.effect.STR_BOOST)
    target:delStatusEffect(dsp.effect.DEX_BOOST)
    target:delStatusEffect(dsp.effect.VIT_BOOST)
    target:delStatusEffect(dsp.effect.AGI_BOOST)
    target:delStatusEffect(dsp.effect.MND_BOOST)
    target:delStatusEffect(dsp.effect.CHR_BOOST)

    target:addStatusEffect(dsp.effect.STR_BOOST,buffvalue,0,duration)
    target:addStatusEffect(dsp.effect.DEX_BOOST,buffvalue,0,duration)
    target:addStatusEffect(dsp.effect.VIT_BOOST,buffvalue,0,duration)
    target:addStatusEffect(dsp.effect.AGI_BOOST,8-buffvalue,0,duration)
    target:addStatusEffect(dsp.effect.INT_BOOST,8-buffvalue,0,duration)
    target:addStatusEffect(dsp.effect.MND_BOOST,8-buffvalue,0,duration)
    target:addStatusEffect(dsp.effect.CHR_BOOST,8-buffvalue,0,duration)
    skill:setMsg(dsp.msg.basic.NONE)
    return 0
end