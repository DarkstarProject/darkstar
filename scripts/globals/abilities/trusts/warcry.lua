-----------------------------------
-- Ability: Warcry
-- Enhances attacks of party members within area of effect.
-- Obtained: Warrior Level 35
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(trust,target,ability)
    return 0,0
end

function onUseAbility(trust,target,ability)
    local power = 0
    local duration = 30

    if trust:getMainJob() == dsp.job.WAR then
        power = math.floor((trust:getMainLvl()/4)+4.75)/256
    else
        power = math.floor((trust:getSubLvl()/4)+4.75)/256
    end

    power = power * 100
    duration = duration + trust:getMod(dsp.mod.WARCRY_DURATION)


    target:addStatusEffect(dsp.effect.WARCRY,power,0,duration,0,0)
end