-----------------------------------
-- Ability: Animated Flourish
-- Provokes the target. Requires at least one, but uses two Finishing Moves.
-- Obtained: Dancer Level 20
-- Finishing Moves Used: 1-2
-- Recast Time: 00:30
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)

    if (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_1)) then
        return 0,0;

    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_2)) then
        return 0,0;

    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_3)) then
        return 0,0;

    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_4)) then
        return 0,0;

    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_5)) then
        return 0,0;
    else
        return msgBasic.NO_FINISHINGMOVES,0;
    end;
end;

function onUseAbility(player,target,ability)
    if (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_1)) then
        player:delStatusEffect(dsp.effects.FINISHING_MOVE_1);

    --Add extra enmity if 2 finishing moves are used
    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_2)) then
        player:delStatusEffect(dsp.effects.FINISHING_MOVE_2);
        target:addEnmity(player, 0, 500);
    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_3)) then
        player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_3);
        player:addStatusEffect(dsp.effects.FINISHING_MOVE_1,1,0,7200);
        target:addEnmity(player, 0, 500);

    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_4)) then
        player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_4);
        player:addStatusEffect(dsp.effects.FINISHING_MOVE_2,1,0,7200);
        target:addEnmity(player, 0, 500);

    elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_5)) then
        player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_5);
        player:addStatusEffect(dsp.effects.FINISHING_MOVE_3,1,0,7200);
        target:addEnmity(player, 0, 500);
    end;
end;