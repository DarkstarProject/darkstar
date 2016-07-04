-----------------------------------
-- Ability: Healing Waltz
-- Removes one detrimental status effect from target party member.
-- Obtained: Dancer Level 35
-- TP Required: 20%
-- Recast Time: 00:15
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (target:getHP() == 0) then
        return MSGBASIC_CANNOT_ON_THAT_TARG,0;
    elseif (player:hasStatusEffect(EFFECT_SABER_DANCE)) then
        return MSGBASIC_UNABLE_TO_USE_JA2, 0;
    elseif (player:hasStatusEffect(EFFECT_TRANCE)) then
        return 0,0;
    elseif (player:getTP() < 200) then
        return MSGBASIC_NOT_ENOUGH_TP,0;
    else
        -- apply waltz recast modifiers
        if (player:getMod(MOD_WALTZ_RECAST)~=0) then
            local recastMod = -150 * (player:getMod(MOD_WALTZ_RECAST)); -- 750 ms or 5% per merit
            if (recastMod <0) then
                --TODO
            end
        end
        return 0,0;
    end;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(EFFECT_TRANCE) then
        player:delTP(200);
    end;

    local effect = target:healingWaltz();

    if (effect == EFFECT_NONE) then
        ability:setMsg(283); -- no effect
    else
        ability:setMsg(123);
    end

    return effect;
end;
