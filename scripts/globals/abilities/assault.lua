-----------------------------------
-- Ability: Assault
-- Orders the avatar to attack.
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
    player:petAttack(target);
end;