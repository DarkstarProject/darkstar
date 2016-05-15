-----------------------------------
-- Ability: Shield Bash
-- Delivers an attack that can stun the target. Shield required.
-- Obtained: Paladin Level 15, Valoredge automaton frame Level 1
-- Recast Time: 3:00 minutes (3:00 for Valoredge version)
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getShieldSize() == 0) then
        return MSGBASIC_REQUIRES_SHIELD,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability)

    local shieldSize = player:getShieldSize();
    local damage = 0;

    local chance = 90;
    damage = player:getMod(MOD_SHIELD_BASH);

    if (shieldSize == 1 or shieldSize == 5) then
        damage = 25 + damage;
    elseif (shieldSize == 2) then
        damage = 38 + damage;
    elseif (shieldSize == 3) then
        damage = 65 + damage;
    elseif (shieldSize == 4) then
        damage = 90 + damage;
    end

    if (player:getMainJob() ~= JOBS.PLD) then
        damage = math.floor(damage / 2.5);
        chance = 60;
    else
        damage = math.floor(damage);
    end

    chance = chance + (player:getMainLvl() - target:getMainLvl())*5;

    if (math.random()*100 < chance) then
        target:addStatusEffect(EFFECT_STUN,1,0,6);
    end

    -- randomize damage
    local ratio = player:getStat(MOD_ATT)/target:getStat(MOD_DEF);
    if (ratio > 1.3) then
        ratio = 1.3;
    end
    if (ratio < 0.2) then
        ratio = 0.2;
    end

    local pdif = (math.random(ratio*0.8*1000, ratio*1.2*1000));

    --printf("damge %d, ratio: %f, pdif: %d\n", damage, ratio, pdif);

    damage = damage * (pdif / 1000);

    target:delHP(damage);
    target:updateEnmityFromDamage(player,damage);

    ability:setMsg(110);

    return damage;
end;