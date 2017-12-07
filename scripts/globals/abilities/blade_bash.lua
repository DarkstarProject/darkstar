-----------------------------------
-- Ability: Blade Bash
-- Deliver an attack that can stun the target and occasionally cause Plague.
-- Obtained: Samurai Level 75
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (not player:isWeaponTwoHanded()) then
        return msgBasic.NEEDS_2H_WEAPON,0;
    else
        return 0,0;
    end
end;

function onUseAbility(player,target,ability)
    -- Stun rate
    if (math.random(1,100) < 99) then
        target:addStatusEffect(EFFECT_STUN,1,0,6);
    end

    -- Yes, even Blade Bash deals damage dependant of Dark Knight level
    local darkKnightLvl = 0;
    local damage = 0;
    if (player:getMainJob() == JOBS.DRK) then
        damage = math.floor(((player:getMainLvl() + 11) / 4) + player:getMod(MOD_WEAPON_BASH));
    elseif (player:getSubJob() == JOBS.DRK) then
        damage = math.floor(((player:getSubLvl() + 11) / 4) + player:getMod(MOD_WEAPON_BASH));
    end

    -- Calculating and applying Blade Bash damage
    target:delHP(damage);
    target:updateEnmityFromDamage(player,damage);

    -- Applying Plague based on merit level.
    if (math.random(1,100) < 65) then
        target:addStatusEffect(EFFECT_PLAGUE,5,0,15 + player:getMerit(MERIT_BLADE_BASH));
    end

    ability:setMsg(msgBasic.JA_DAMAGE)

    return damage;
end;
