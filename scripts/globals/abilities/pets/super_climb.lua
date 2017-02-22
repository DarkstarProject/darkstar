-----------------------------------
-- Ability: Super Climb
-- Used by the Wyvern when the Dragoon uses Super Jump. 
-- Does not shed hate, but allows the wyvern to dodge any attack like the Dragoon.
-- Obtained: Dragoon Level 50
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

end;
