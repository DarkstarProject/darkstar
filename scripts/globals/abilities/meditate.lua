-----------------------------------
-- Ability: Meditate
-- Gradually charges TP.
-- Obtained: Samurai Level 30
-- Recast Time: 3:00 (Can be reduced to 2:30 using Merit Points)
-- Duration: 15 seconds
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local amount = 12
    if (player:getMainJob() == dsp.job.SAM) then
        amount = 20
    end
    local duration = 15 + player:getMod(dsp.mod.MEDITATE_DURATION)
    player:addStatusEffectEx(dsp.effect.MEDITATE,0,amount,3,duration)
end