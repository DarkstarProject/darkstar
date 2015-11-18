-----------------------------------
-- Ability: Blade Bash
-- Deliver an attack that can stun the target and occasionally cause Plague.
-- Obtained: Samurai Level 75
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (not player:isWeaponTwoHanded()) then
        return MSGBASIC_NEEDS_2H_WEAPON,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    -- Stun rate
    if (math.random(1,100) < 99) then
        target:addStatusEffect(EFFECT_STUN,1,0,6);
    end

    -- Yes, even Blade Bash deals damage dependant of Dark Knight level
    local darkKnightLvl = 0;
    local damage = 0;
    if (player:getMainJob()==JOB_DRK) then
        damage = math.floor(((player:getMainLvl() + 11) / 4) + player:getMod(MOD_WEAPON_BASH));
    elseif (player:getSubJob()==JOB_DRK) then
        damage = math.floor(((player:getSubLvl() + 11) / 4) + player:getMod(MOD_WEAPON_BASH));
    end

    -- Calculating and applying Blade Bash damage
    target:delHP(damage);
    target:updateEnmityFromDamage(player,damage);

    -- Applying Plague based on merit level.
    if (math.random(1,100) < 65) then
        target:addStatusEffect(EFFECT_PLAGUE,5,0,15 + player:getMerit(MERIT_BLADE_BASH));
    end

    ability:setMsg(110)

    return damage;
end;