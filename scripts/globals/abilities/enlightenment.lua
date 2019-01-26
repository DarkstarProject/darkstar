-----------------------------------
-- Ability: Enlightenment
-- Your next spell cast may be any from your list regardless of addenda.
-- Obtained: Scholar Level 75
-- Recast Time: 0:05:00
-- Duration: 0:01:00 or 1 Spell, whichever occurs first
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:hasStatusEffect(dsp.effect.ENLIGHTENMENT) then
        return dsp.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end
    return 0,0
end

function onUseAbility(player,target,ability)
    local merit = (player:getMerit(dsp.merit.ENLIGHTENMENT) - 5)
    player:addStatusEffect(dsp.effect.ENLIGHTENMENT,merit,0,60)
    return dsp.effect.ENLIGHTENMENT
end