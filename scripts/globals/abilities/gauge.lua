-----------------------------------
-- Ability: Gauge
-- Checks to see if an enemy can be charmed.
-- Obtained: Beastmaster Level 10
-- Recast Time: 0:30
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() ~= nil ) then
        return MSGBASIC_ALREADY_HAS_A_PET,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)

end;
