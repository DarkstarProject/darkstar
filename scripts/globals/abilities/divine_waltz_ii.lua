-----------------------------------
-- Ability: Divine Waltz II
-- Restores the HP of all party members within a small radius.
-- Obtained: Dancer Level 78
-- TP Required: 80%
-- Recast Time: 00:20
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
    elseif (player:getTP() < 800) then
        return MSGBASIC_NOT_ENOUGH_TP,0;
    else
        -- Apply waltz recast modifiers
        if (player:getMod(MOD_WALTZ_RECAST)~=0) then
            local recastMod = -130 * (player:getMod(MOD_WALTZ_RECAST)); -- 650 ms per 5% (per merit)
            if (recastMod < 0) then
                --TODO
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
        player:delTP(800);
    end;

    -- Grabbing variables.
    local vit = target:getStat(MOD_VIT);
    local chr = player:getStat(MOD_CHR);
    local mjob = player:getMainJob(); --19 for DNC main.
    local sjob = player:getSubJob();
    local cure = 0;

    -- Performing sj mj check.
    if (mjob == 19) then
        cure = (vit+chr)*0.75+270;
    end

    if (sjob == 19) then
        cure = (vit+chr)*0.175+270;
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
