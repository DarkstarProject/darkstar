-----------------------------------
-- Ability: Fold
-- Erases one roll or bust dsp.effect. Targets self-cast effect with the longest remaining duration.
-- Obtained: Corsair Level 75
-- Recast Time: 00:05:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (target:hasCorsairEffect()) then
        return 0,0
    else
        return dsp.msg.basic.CANNOT_PERFORM,0
    end
end

function onUseAbility(player,target,ability)
    target:fold()

    local merit = target:getMerit(dsp.merit.FOLD)
    merit = merit - 10

    if (math.random(0, 99) < merit) then
        target:resetRecast(dsp.recast.ABILITY,193)
    end

    return dsp.effect.FOLD
end