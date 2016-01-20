-----------------------------------
-- Ability: Animated Flourish
-- Provokes the target. Requires at least one, but uses two Finishing Moves.
-- Obtained: Dancer Level 20
-- Finishing Moves Used: 1-2
-- Recast Time: 00:30
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)

    if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
        return 0,0;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
        return 0,0;
    else    
        return MSGBASIC_NO_FINISHINGMOVES,0;
    end;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
        player:delStatusEffect(EFFECT_FINISHING_MOVE_1);

    --Add extra enmity if 2 finishing moves are used
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
        player:delStatusEffect(EFFECT_FINISHING_MOVE_2);
        target:addEnmity(player, 0, 500);
    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
        player:delStatusEffectSilent(EFFECT_FINISHING_MOVE_3);
        player:addStatusEffect(EFFECT_FINISHING_MOVE_1,1,0,7200);
        target:addEnmity(player, 0, 500);

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
        player:delStatusEffectSilent(EFFECT_FINISHING_MOVE_4);
        player:addStatusEffect(EFFECT_FINISHING_MOVE_2,1,0,7200);
        target:addEnmity(player, 0, 500);

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
        player:delStatusEffectSilent(EFFECT_FINISHING_MOVE_5);
        player:addStatusEffect(EFFECT_FINISHING_MOVE_3,1,0,7200);    
        target:addEnmity(player, 0, 500);
    end;
end;