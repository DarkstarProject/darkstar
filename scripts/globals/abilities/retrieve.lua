-----------------------------------
-- Ability: Retrieve
-- Orders your automaton to return to your side.
-- Obtained: Puppetmaster Level 10
-- Recast Time: 10 seconds
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
    player:petRetreat();
end;