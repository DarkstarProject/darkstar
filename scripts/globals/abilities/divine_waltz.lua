-----------------------------------
-- Ability: Divine Waltz
-- Heals party members within area of effect.
-- Obtained: Dancer Level 25
-- TP Required: 40%
-- Recast Time: 00:13
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
    elseif (player:getTP() < 400) then
        return MSGBASIC_NOT_ENOUGH_TP,0;
    else
        --[[ Apply "Waltz Ability Delay" reduction
            1 modifier = 1 second]]
        local recastMod = player:getMod(MOD_WALTZ_DELAY);
        if (recastMod ~= 0) then
            local newRecast = ability:getRecast() +recastMod;
            ability:setRecast(utils.clamp(newRecast,0,newRecast));
        end
        -- Apply "Fan Dance" Waltz recast reduction
        if (player:hasStatusEffect(EFFECT_FAN_DANCE)) then
            local fanDanceMerits = target:getMerit(MERIT_FAN_DANCE);
            -- Every tier beyond the 1st is -5% recast time
            if (fanDanceMerits > 5) then
                ability:setRecast(ability:getRecast() * ((fanDanceMerits -5)/100));
            end
        end
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    -- Only remove TP if the player doesn't have Trance, and only deduct once instead of for each target.
    if (player:getID() == target:getID() and player:hasStatusEffect(EFFECT_TRANCE) == false) then
        player:delTP(400);
    end;

    -- Grabbing variables.
    local vit = target:getStat(MOD_VIT);
    local chr = player:getStat(MOD_CHR);
    local mjob = player:getMainJob(); --19 for DNC main.
    local sjob = player:getSubJob();
    local cure = 0;

    -- Performing sj mj check.
    if (mjob == 19) then
        cure = (vit+chr)*0.25+60;
    end

    if (sjob == 19) then
        cure = (vit+chr)*0.125+60;
    end

    -- Apply waltz modifiers
    cure = math.floor(cure * (1.0 + (player:getMod(MOD_WALTZ_POTENTCY)/100)));

    -- Cap the final amount to max HP.
    if ((target:getMaxHP() - target:getHP()) < cure) then
        cure = (target:getMaxHP() - target:getHP());
    end

    -- Applying server mods....
    cure = cure * CURE_POWER;

    target:restoreHP(cure);
    target:wakeUp();
    player:updateEnmityFromCure(target,cure);

    return cure;
end;
