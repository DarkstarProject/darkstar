-----------------------------------
-- Ability: Reverse Flourish
-- Converts remaining finishing moves into TP. Requires at least one Finishing Move.
-- Obtained: Dancer Level 40
-- Finishing Moves Used: 1-5
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

    local TPGain = 0;
    local STM = 0.5;
    if player:getEquipID(SLOT_HANDS) == 11222 then
        STM = 1.0;
    elseif player:getEquipID(SLOT_HANDS) == 11122 then
        STM = 1.5;
    end
    local Merits = player:getMerit(MERIT_REVERSE_FLOURISH_EFFECT);

    if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
        TPGain = 9.5 * 1 + STM * 1 ^ 2 + Merits;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
        TPGain = 9.5 * 2 + STM * 2 ^ 2 + Merits;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
        TPGain = 9.5 * 3 + STM * 3 ^ 2 + Merits;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
        TPGain = 9.5 * 4 + STM * 4 ^ 2 + Merits;

    elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
        TPGain = 9.5 * 5 + STM * 5 ^ 2 + Merits;
    end;
    
    TPGain = TPGain * 10;
    
    player:addTP(TPGain);
    player:delStatusEffect(EFFECT_FINISHING_MOVE_1);
    player:delStatusEffect(EFFECT_FINISHING_MOVE_2);
    player:delStatusEffect(EFFECT_FINISHING_MOVE_3);
    player:delStatusEffect(EFFECT_FINISHING_MOVE_4);
    player:delStatusEffect(EFFECT_FINISHING_MOVE_5);
    
    return TPGain;
end;