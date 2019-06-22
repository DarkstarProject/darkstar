-----------------------------------
-- Ability: Building Flourish
-- Enhances potency of your next weapon skill. Requires at least one Finishing Move.
-- Obtained: Dancer Level 50
-- Finishing Moves Used: 1-3
-- Recast Time: 00:10
-- Duration: 01:00
--
-- Using one Finishing Move boosts the Accuracy of your next weapon skill.
-- Using two Finishing Moves boosts both the Accuracy and Attack of your next weapon skill.
-- Using three Finishing Moves boosts the Accuracy, Attack and Critical Hit Rate of your next weapon skill.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)

    if (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_1)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_2)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_3)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_4)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_5)) then
        return 0,0

    else
        return dsp.msg.basic.NO_FINISHINGMOVES,0
    end
end

function onUseAbility(player,target,ability)

    if (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_1)) then
        player:delStatusEffect(dsp.effect.FINISHING_MOVE_1)
        player:addStatusEffect(dsp.effect.BUILDING_FLOURISH,1,0,60, 0, player:getMerit(dsp.merit.BUILDING_FLOURISH_EFFECT))
    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_2)) then
        player:delStatusEffect(dsp.effect.FINISHING_MOVE_2)
        player:addStatusEffect(dsp.effect.BUILDING_FLOURISH,2,0,60, 0, player:getMerit(dsp.merit.BUILDING_FLOURISH_EFFECT))
    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_3)) then
        player:delStatusEffect(dsp.effect.FINISHING_MOVE_3)
        player:addStatusEffect(dsp.effect.BUILDING_FLOURISH,3,0,60, 0, player:getMerit(dsp.merit.BUILDING_FLOURISH_EFFECT))
    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_4)) then
        player:delStatusEffect(dsp.effect.FINISHING_MOVE_4)
        player:addStatusEffect(dsp.effect.FINISHING_MOVE_1,1,0,7200)
        player:addStatusEffect(dsp.effect.BUILDING_FLOURISH,3,0,60, 0, player:getMerit(dsp.merit.BUILDING_FLOURISH_EFFECT))
    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_5)) then
        player:delStatusEffect(dsp.effect.FINISHING_MOVE_5)
        player:addStatusEffect(dsp.effect.FINISHING_MOVE_2,1,0,7200)
        player:addStatusEffect(dsp.effect.BUILDING_FLOURISH,3,0,60, 0, player:getMerit(dsp.merit.BUILDING_FLOURISH_EFFECT))
    end

end