-----------------------------------
-- Ability: Charm a monster
-- Tames a monster to fight by your side.
-- Obtained: Beastmaster Level 1
-- Recast Time: 0:15
-- Duration: Varies
-- Check            |Duration
-- ---------------- |--------------
-- Too Weak         |30 Minutes
-- Easy Prey        |20 Minutes
-- Decent Challenge |10 Minutes
-- Even Match       |3.0 Minutes
-- Tough            |1.5 Minutes
-- Very Tough       |1-20 seconds
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() ~= nil) then
        return msgBasic.ALREADY_HAS_A_PET,0;
    elseif (target:getMaster() ~= nil and target:getMaster():isPC()) then
        return msgBasic.THAT_SOMEONES_PET,0;
    else
        return 0,0;
    end
end;

function onUseAbility(player,target,ability)
    local Tamed = false;

    if (player:getLocalVar("Tamed_Mob") == target:getID())then
        player:addMod(MOD_CHARM_CHANCE, 10);
        Tamed = true;
    end

    player:charmPet(target);

    if (Tamed == true) then
        player:delMod(MOD_CHARM_CHANCE, 10);
        player:setLocalVar("Tamed_Mob",0);
    end
end;
