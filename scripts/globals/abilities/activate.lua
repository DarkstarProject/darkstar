-----------------------------------
-- Ability: Activate
-- Calls forth your automaton.
-- Obtained: Puppetmaster Level 1
-- Recast Time: 0:20:00 (0:16:40 with full merits)
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() ~= nil) then
        return MSGBASIC_ALREADY_HAS_A_PET,0;
    elseif (not player:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:spawnPet(PET_AUTOMATON);
end;