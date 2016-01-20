-----------------------------------
-- Ability: Retreat
-- Orders the avatar to hold back.
-- Obtained: Summoner Level 1
-- Recast Time: 10 sec
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
    player:petRetreat();
end;