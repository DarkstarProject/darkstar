-----------------------------------
-- Ability: Activate
-- Calls forth your automaton.
-- Obtained: Puppetmaster Level 1
-- Recast Time: 0:20:00 (0:16:40 with full merits)
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() ~= nil) then
        return dsp.msg.basic.ALREADY_HAS_A_PET,0
    elseif (not player:canUseMisc(dsp.zoneMisc.PET)) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA,0
    else
        return 0,0
    end
end

function onUseAbility(player,target,ability)
    player:spawnPet(dsp.pet.id.AUTOMATON)
end