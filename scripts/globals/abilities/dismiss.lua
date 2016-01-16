-----------------------------------
-- Ability: Dismiss
-- Sends the Wyvern away.
-- Obtained: Dragoon Level 1
-- Recast Time: 5.00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    -- Reset the Call Wyvern Ability.
    local pet = player:getPet();
    if pet:getHP() == pet:getMaxHP() then
        player:resetRecast(RECAST_ABILITY, 163); -- call_wyvern
    end;
    target:despawnPet();
end;
